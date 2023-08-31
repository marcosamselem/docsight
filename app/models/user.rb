class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :qualifications
  has_many :procedures
  has_many :locations, through: :doctors_locations
  has_many :appointments_as_patient, class_name: "Appointment", foreign_key: :patient_id
  has_many :appointments_as_doctor, class_name: "Appointment", foreign_key: :doctor_id
end
