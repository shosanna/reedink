class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reading_statuses
  has_many :progresses, through: :reading_statuses
  has_many :books, through: :reading_statuses
  has_many :skills

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
end
