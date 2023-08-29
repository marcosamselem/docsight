class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :location
  belongs_to :procedure
  has_many :reviews
  validates :symptoms, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
