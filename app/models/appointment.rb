class Appointment < ApplicationRecord
  belongs_to :location
  enum :status, ["pending", "accepted", "declined"]
  belongs_to :patient, class_name: "User"
  belongs_to :doctor, class_name: "User"
end
