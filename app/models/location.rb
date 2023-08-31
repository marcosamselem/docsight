class Location < ApplicationRecord
  has_many :users, through: :doctors_locations
end
