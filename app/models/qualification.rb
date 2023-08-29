class Qualification < ApplicationRecord
  belongs_to :doctor
  validates :name, presence: true
  validates :year_obtained, presence: true
  validates :establishment, presence: true
end
