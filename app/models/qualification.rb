class Qualification < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :year_obtained, presence: true
  validates :establishment, presence: true
end
