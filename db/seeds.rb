# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"



puts "cleaning db"
Location.destroy_all
User.destroy_all
puts "seeding db"

User.create!({email: "marcosa@gmail.com", password: "123456", first_name: "Marcos", last_name: "Amselem", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})
User.create!({email: "miguel@gmail.com", password: "123456", first_name: "Miguel", last_name: "Belo", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})
User.create!({email: "david@gmail.com", password: "123456", first_name: "David", last_name: "Whitehead", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})
User.create!({email: "ai@gmail.com", password: "123456", first_name: "Ai", last_name: "Miyuki", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "female", past_interventions: "None"})
User.create!({email: "yusuf@gmail.com", password: "123456", first_name: "Yusuf", last_name: "Uras", phone_number: "+4412375637", date_of_birth: "25/12/1969", gender: "male", past_interventions: "None"})

specialties = ["Orthopaedics", "Plastic Surgery", "Otolaryngology", "Ophthalmology", "Obstetrics and gynaecology", "Urology", "Cardiology", "Oncology", "Dermatology", "Paediatrics", "Vascular surgery", "Geriatric medicine", "General Internal medicine", "General Practice", "Gastro-enterology"]

HOSPITALS = [
  ["Homerton University Hospital", "Homerton Row, Homerton Row, London, Greater London, E9 6SR"],
  ["Royal London Hospital", "Whitechapel, London, Greater London, E1 1BB"],
  ["Moorfields Eye Hospital ", " 162 City Road, London, EC1V 2PD"],
  ["St Bartholomew's Hospital", "St Bartholomew’s Hospital, West Smithfield, City of London, EC1A 7BE"],
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
  puts "created #{Location.last.name} hospital"
end

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
  puts "created #{User.last.first_name} doctor"
  DoctorsLocation.create!(user_id: User.last.id, location_id: Location.all.sample.id)
end
