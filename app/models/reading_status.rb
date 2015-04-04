class ReadingStatus < ActiveRecord::Base
  include ArelHelpers::ArelTable

  belongs_to :user
  belongs_to :book

  has_many :progresses
  has_many :notes

  validate :user, :book, presence: true

  def furthest_read
    progresses.maximum(:page_to) || 0
  end

  def notes_for_progress(progress)
    notes.where("date(created_at) = date(?)", created_at)
  end
end
