class ReadingStatus < ActiveRecord::Base
  include ArelHelpers::ArelTable

  belongs_to :user
  belongs_to :book

  has_many :progresses

  validate :user, :book, presence: true

end
