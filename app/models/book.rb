class Book < ActiveRecord::Base
  validates :title, :author, :page_count, presence: true
end
