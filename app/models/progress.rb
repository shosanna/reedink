class Progress < ActiveRecord::Base
  belongs_to :reading_status
  validate :reading_status, presence: true

  def book
    reading_status.book
  end
end
