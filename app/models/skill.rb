class Skill < ActiveRecord::Base
  belongs_to :user
  has_many :reports

  validates :name, :user, presence: true
end
