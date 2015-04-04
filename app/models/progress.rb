class Progress < ActiveRecord::Base
  belongs_to :reading_status
  validate :reading_status, presence: true

  after_create :touch_reading_status

  def book
    reading_status.book
  end

  private

  def touch_reading_status
    reading_status.touch(:last_progress_at)
  end
end
