# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "Cleaning all DB's (Locations, Procedures and Users)"
Procedure.destroy_all
Review.destroy_all
Appointment.destroy_all
Location.destroy_all
User.destroy_all
puts "Seeding db..."

User.create!({email: "marcosa@gmail.com", password: "123456", first_name: "Marcos", last_name: "Amselem", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})
miguel = User.create!({email: "miguel@gmail.com", password: "123456", first_name: "Miguel", last_name: "Belo", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})
User.create!({email: "david@gmail.com", password: "123456", first_name: "David", last_name: "Whitehead", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})
User.create!({email: "ai@gmail.com", password: "123456", first_name: "Ai", last_name: "Miyuki", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "female", past_interventions: "None"})
User.create!({email: "yusuf@gmail.com", password: "123456", first_name: "Yusuf", last_name: "Uras", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})

specialties = ["Orthopaedics", "Plastic Surgery", "Otolaryngology", "Ophthalmology", "Obstetrics and gynaecology", "Urology", "Cardiology", "Oncology", "Dermatology", "Paediatrics", "Vascular surgery", "Geriatric medicine", "General Internal medicine", "General Practice", "Gastro-enterology"]

specialty_procedures = {
  "Orthopaedics": [
    { name: "Joint Replacement", price: 8000, duration: 180 },
    { name: "Fracture Repair", price: 5000, duration: 120 },
    { name: "Spinal Fusion", price: 9000, duration: 240 },
    { name: "ACL Reconstruction", price: 7000, duration: 150 },
    { name: "Hip Arthroscopy", price: 7500, duration: 135 }
  ],
  "Plastic Surgery": [
    { name: "Rhinoplasty", price: 6000, duration: 240 },
    { name: "Breast Augmentation", price: 7000, duration: 180 },
    { name: "Liposuction", price: 5500, duration: 120 },
    { name: "Facelift", price: 8000, duration: 180 },
    { name: "Botox Injections", price: 3000, duration: 30 }
  ],
  "Otolaryngology": [
    { name: "Tonsillectomy", price: 4000, duration: 90 },
    { name: "Sinus Surgery", price: 5500, duration: 120 },
    { name: "Adenoidectomy", price: 3500, duration: 60 },
    { name: "Septoplasty", price: 5000, duration: 90 },
    { name: "Ear Tube Insertion", price: 2500, duration: 45 }
  ],
  "Ophthalmology": [
    { name: "Cataract Surgery", price: 4500, duration: 60 },
    { name: "LASIK", price: 3500, duration: 30 },
    { name: "Glaucoma Surgery", price: 6000, duration: 90 },
    { name: "Retinal Detachment Repair", price: 8000, duration: 120 },
    { name: "Corneal Transplant", price: 7000, duration: 150 }
  ],
  "Obstetrics and gynaecology": [
    { name: "Cesarean Section", price: 10000, duration: 120 },
    { name: "Hysterectomy", price: 8000, duration: 150 },
    { name: "Pap Smear", price: 1500, duration: 15 },
    { name: "Dilation and Curettage (D&C)", price: 3000, duration: 60 },
    { name: "IUD Insertion", price: 2000, duration: 30 }
  ],
  "Urology": [
    { name: "Kidney Stone Removal", price: 6000, duration: 90 },
    { name: "Prostatectomy", price: 7500, duration: 180 },
    { name: "Bladder Biopsy", price: 4500, duration: 45 },
    { name: "Cystoscopy", price: 3500, duration: 30 },
    { name: "Vasectomy", price: 5000, duration: 60 }
  ],
  "Cardiology": [
    { name: "Angioplasty", price: 12000, duration: 120 },
    { name: "Pacemaker Implantation", price: 9000, duration: 90 },
    { name: "Cardiac Catheterization", price: 8000, duration: 75 },
    { name: "Echocardiogram", price: 3500, duration: 45 },
    { name: "Stress Test", price: 2500, duration: 30 }
  ],
  "Oncology": [
    { name: "Chemotherapy", price: 5000, duration: 180 },
    { name: "Radiation Therapy", price: 7000, duration: 120 },
    { name: "Surgery for Tumor Removal", price: 9000, duration: 150 },
    { name: "Biopsy", price: 3000, duration: 60 },
    { name: "Immunotherapy", price: 6000, duration: 90 }
  ],
  "Dermatology": [
    { name: "Skin Biopsy", price: 300, duration: 20 },
    { name: "Acne Treatment", price: 150, duration: 30 },
    { name: "Skin Allergy Testing", price: 250, duration: 45 },
    { name: "Laser Hair Removal", price: 200, duration: 15 },
    { name: "Mole Removal", price: 180, duration: 20 }
  ],
  "Paediatrics": [
    { name: "Child Vaccination", price: 100, duration: 10 },
    { name: "Growth Monitoring", price: 50, duration: 15 },
    { name: "Pediatric Check-up", price: 75, duration: 20 },
    { name: "Developmental Assessment", price: 120, duration: 30 },
    { name: "Asthma Management", price: 90, duration: 25 }
  ],
  "Vascular surgery": [
    { name: "Varicose Vein Removal", price: 4500, duration: 90 },
    { name: "Aneurysm Repair", price: 8000, duration: 180 },
    { name: "Carotid Endarterectomy", price: 6000, duration: 120 },
    { name: "Peripheral Artery Bypass", price: 7000, duration: 150 },
    { name: "Angiogram", price: 3500, duration: 75 }
  ],
  "Geriatric medicine": [
    { name: "Elderly Health Assessment", price: 200, duration: 30 },
    { name: "Dementia Evaluation", price: 300, duration: 45 },
    { name: "Osteoporosis Screening", price: 150, duration: 20 },
    { name: "Falls Risk Assessment", price: 100, duration: 15 },
    { name: "Polypharmacy Review", price: 80, duration: 10 }
  ],
  "General Internal medicine": [
    { name: "Physical Examination", price: 150, duration: 30 },
    { name: "Chronic Disease Management", price: 250, duration: 60 },
    { name: "Blood Pressure Check", price: 50, duration: 10 },
    { name: "Diabetes Management", price: 180, duration: 45 },
    { name: "Thyroid Function Test", price: 120, duration: 20 }
  ],
  "General Practice": [
    { name: "Routine Check-up", price: 100, duration: 20 },
    { name: "Minor Illness Treatment", price: 75, duration: 15 },
    { name: "Prescription Refill", price: 30, duration: 5 },
    { name: "Ear Infection Treatment", price: 50, duration: 10 },
    { name: "Cough and Cold Consultation", price: 40, duration: 10 }
  ],
  "Gastro-enterology": [
    { name: "Endoscopy", price: 3000, duration: 60 },
    { name: "Colonoscopy", price: 3500, duration: 90 },
    { name: "Gastrointestinal Consultation", price: 150, duration: 30 },
    { name: "Liver Function Test", price: 120, duration: 20 },
    { name: "Irritable Bowel Syndrome Management", price: 180, duration: 45 }
  ]
}

HOSPITALS = [
  ["Homerton University Hospital", "Homerton Row, Homerton Row, London, Greater London, E9 6SR"],
  ["Royal London Hospital", "Whitechapel, London, Greater London, E1 1BB"],
  ["Moorfields Eye Hospital ", " 162 City Road, London, EC1V 2PD"],
  ["St Bartholomew's Hospital", "St Bartholomew's Hospital, West Smithfield, City of London, EC1A 7BE"],
  ["Guy's Hospital", "Great Maze Pond, London, SE1 9RT"],
  ["Great Ormond Street Hospital", "Great Ormond Street, London, Greater London, WC1N 3JH"],
  ["Royal National ENT and Eastman Dental Hospitals", "47-49 Huntley St, London, WC1E 6DG"],
  ["St Thomas'", "Westminster Bridge Road, London, SE1 7EH"],
  ["Weymouth Street Hospital", "42-46 Weymouth Street, London, Greater London, W1G 6NP"],
  ["Royal Free Hospital", "Pond Street, London, NW3 2QG"],
  ["The Portland Hospital For Women & Children", " 209 Great Portland Street, London, Greater London, W1W 5AH"],
  ["The Royal Marsden Hospital", "Fulham Road, London, SW3 6JJ"],
  ["King's College Hospital", "Denmark Hill, London, SE5 9RS"],
  ["Maudsley Hospital", "Denmark Hill, London, SE5 8AZ"],
  ["Lambeth Hospital", "108 Landor Road, 108 Landor Road, London, SW9 9NU"],
  ["Hospital Of St John & St Elizabeth", "60 Grove End Road, London, Greater London, NW8 9NH"],
  ["Wellington Hospital", "Wellington South, Wellington Place, London, NW8 9LE"],
  ["Royal Brompton Hospital", "Sydney Street, London, Greater London, SW3 6NP"],
  ["Lister Hospital", "Chelsea Bridge Road, London, Greater London, SW1W 8RH"]
]

HOSPITALS.each do |hosp|
  Location.create!(name: hosp[0], address: hosp[1])
  # puts "created #{Location.last.name} hospital"
end

puts ".....Hospitals created. Creating Doctors....."

100.times do

  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.sentence,
    phone_number: Faker::PhoneNumber.cell_phone,
    image_url: Faker::Avatar.image,
    specialty: specialties.sample,
    email: Faker::Internet.email,
    password: "123456",
    role: "doctor"
  )
  # Convert locations to an array
  locations = Location.all.to_a

  # Shuffle the locations array to randomize location assignments
  shuffled_locations = locations.shuffle
  shuffled_locations.take(3).each do |location|
    DoctorsLocation.create!(user_id: User.last.id, location_id: location.id)
  end


  appointment = Appointment.create!( location_id: Location.all.first.id,
    additional_details: "details",
    symptoms: "headache",
    start_time: "12:00",
    end_time: "12:30",
    status: 0,
    patient_id: miguel.id,
    doctor_id: User.last.id,
  )

  Review.create!(
    appointment_id: appointment.id,
    rating: 5,
    comment: "Lovley doctor"
  )

end

puts "....Doctors created. Creating procedures for the Specialties...."

specialty_procedures.each do |specialty, procedures|
  doctors = User.where(role: "doctor", specialty: specialty)
  doctors.each do |doctor|
    procedures.each do |procedure|
      # puts procedure
      Procedure.create!(
        name: procedure[:name],
        price: procedure[:price],
        duration: procedure[:duration],
        user_id: doctor.id
      )
    end
  end
end

# create appointment
# create reviews
puts "seeding a DUMMY appointment"
first_appointment = Appointment.create!( location_id: Location.all.first.id,
                  additional_details: "details",
                  symptoms: "headache",
                  start_time: "12:00",
                  end_time: "12:30",
                  status: 0,
                  patient_id: miguel.id,
                  doctor_id: User.last.id,
                )

Review.create!(
              appointment_id: first_appointment.id,
              rating: 5,
              comment: "Lovley doctor" )


# t.bigint "location_id", null: false
# t.text "additional_details"
# t.string "symptoms"
# t.time "start_time"
# t.time "end_time"
# t.integer "status", default: 0
# t.bigint "patient_id"
# t.bigint "doctor_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
# t.index ["location_id"], name: "index_appointments_on_location_id"
# t.index ["patient_id"], name: "index_appointments_on_patient_id"

# puts "Seeding completed. Thank you for your patient ;-) "
