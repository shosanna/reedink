class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reading_statuses
  has_many :progresses, through: :reading_statuses
  has_many :books, through: :reading_statuses

  def reading?(book)
    books.include? book
  end

  def status_for(book)
    reading_statuses.where(book_id: book.id).first
  end

  def progress_for(book)
    reading_statuses.where(book_id: book.id).first.progresses
  end
end
