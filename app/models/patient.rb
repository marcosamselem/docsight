class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :doctors, through: :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :past_interventions, presence: true
  validates :past_interventions, length: { minimum: 2 }
end
