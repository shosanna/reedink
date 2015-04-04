class Note < ActiveRecord::Base
  belongs_to :reading_status

  validates :text, :reading_status presence: true
end
