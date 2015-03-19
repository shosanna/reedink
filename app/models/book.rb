class Book < ActiveRecord::Base
  include ArelHelpers::ArelTable

  validates :title, :author, :page_count, presence: true

  has_many :reading_statuses
  has_many :progresses, through: :reading_statuses
  has_many :users, through: :reading_statuses

  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  def tag_names
    tags.map(&:name).join(",")
  end

  def tag_names=(value)
    tags.destroy_all

    value.split(",").each do |tag_name|
      tag = Tag.where(name: tag_name).first
      if tag
        Tagging.create!(taggable: self, tag: tag)
      else
        tags.create!(name: tag_name)
      end
    end
  end
end
