class ReadingStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :progresses

  validate :user, :book, presence: true
end
