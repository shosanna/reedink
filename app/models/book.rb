class Book < ActiveRecord::Base
  validates :title, :author, :page_count, presence: true

  has_many :reading_statuses
  has_many :users, through: :reading_statuses
end
