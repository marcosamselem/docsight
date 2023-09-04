class Appointment < ApplicationRecord
  belongs_to :location
  has_many :procedures, through: :procedure_appointments
  enum :status, ["pending", "accepted", "declined"]
  belongs_to :patient, class_name: "User"
  belongs_to :doctor, class_name: "User"
  validates :symptoms, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true


end
