class Progress < ActiveRecord::Base
  belongs_to :reading_status
  validate :reading_status, presence: true

  after_create :touch_reading_status

  def book
    reading_status.book
  end

  def pages_read
    page_to - page_from
  end

  private

  def touch_reading_status
    reading_status.touch(:last_progress_at)
  end
end
