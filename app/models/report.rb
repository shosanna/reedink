class Report < ActiveRecord::Base
  belongs_to :skill

  validate :skill, presence: true
end
