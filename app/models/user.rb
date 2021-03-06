class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reading_statuses
  has_many :progresses, through: :reading_statuses
  has_many :notes, through: :reading_statuses
  has_many :books, through: :reading_statuses
  has_many :skills
  has_many :reports, through: :skills

  has_many :owned_books, foreign_key: "user_id", class_name: "Book"

  def reading?(book)
    books.include? book
  end

  def status_for(book)
    reading_statuses.where(book_id: book.id).first
  end

  def progress_for(book)
    reading_statuses.where(book_id: book.id).first.progresses
  end

  def read_pages(status_id)
    status = reading_statuses.find(status_id)
    status.progresses.map { |p| p.page_to - p.page_from }.sum
  end

  def last_read_books
    reading_statuses.order(last_progress_at: :desc).first(2).map(&:book)
  end

  def total_pages_per_day(day)
    reading_statuses.flat_map do |status|
      status.progresses.map do |x|
        if day.to_date == x.created_at.to_date
          x.page_to - x.page_from
        else
          0
        end
      end
    end.sum
  end

  def skill_data
    skills.map do |skill|
      {
        skill: skill.name,
        data: (7.days.ago.to_date).upto(Date.today).map do |date|
          {
            skill_id: skill.id,
            date: date.strftime("%Y-%-m-%-d"),
            report: !!skill.reports.where("date(created_at) = ?", date).first
          }
        end
      }
    end
  end

  def self.challenge_data
    all.map do |user|
      data = user.progresses.map do |progress|
        {
          pages: progress.pages_read,
          date: progress.created_at.to_date,
          book: progress.reading_status.book
        }
      end.group_by { |p| p[:date] }

      data = data.map do |key, val|
        [key, {
          total: val.sum { |x| x[:pages] },
          progresses: val
        }]
      end

      {
        user: user,
        data: Hash[data]
      }
    end
  end
end
