class ReadingStatus < ActiveRecord::Base
  include ArelHelpers::ArelTable

  belongs_to :user
  belongs_to :book

  has_many :progresses

  validate :user, :book, presence: true

  def furthest_read
    progresses.maximum(:page_to) || 0
  end
end
