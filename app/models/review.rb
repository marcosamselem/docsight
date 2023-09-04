class Review < ApplicationRecord
  belongs_to :appointment
  validates :rating, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }

  def self.find_review(appointments)
    appointments.each do |appointment|
      Review.where(appointment_id: )
    end
  end
end
