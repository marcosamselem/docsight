class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :procedures
  has_many :qualifications
  has_many :specialties
  has_many :appointments
  has_many :locations, through: :appointments
  has_many :patients, through: :appointments
  has_many :reviews, through: :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
  validates :phone_number, presence: true
  validates :bio, length: { minimum: 6 }
  validates :bio, length: { maximum: 250 }
end
