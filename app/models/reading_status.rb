class ReadingStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validate :user, :book, presence: true
end
