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

doctor_img = [
  "https://th.bing.com/th/id/OIP.50yPCijsspiFOg8ZEwqJTwHaJ8?w=142&h=191&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.IVwf85npYYUcwRp4EIhqDgHaJm?w=147&h=191&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.nmAwZ0-dn7D4KYDzZOegcgHaKA?w=142&h=191&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.LczXdrMkR1M0DA0Q6diejQHaIH?w=173&h=191&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.7ZuYwrIdy7FFk5IXAI7bcAHaGl?w=214&h=191&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.hYd9jPssD4Eo67zNhtk8VQHaFj?w=248&h=186&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.RPRpZ0mTLLrHDqxz4rhZuwHaHp?w=181&h=186&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.s3mQLGK7nHMzwrv3BNgQTAHaEl?w=302&h=187&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.Of1m8q2q5J6my51mKxKlYgHaLH?pid=ImgDet&rs=1",
  "https://th.bing.com/th/id/R.7b5bd1b5deeb081550e97fabda90b7c9?rik=eKg2cctOemQqsg&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/OIP.xiRxoiNopil-klH9J0NKDwAAAA?pid=ImgDet&rs=1",
  "https://pneumogalati.ro/wp-content/uploads/2019/02/21.png",
  "https://th.bing.com/th/id/OIP.s_yTNeHlUGiJJ61pP2N7FQHaHa?pid=ImgDet&rs=1",
  "https://th.bing.com/th/id/OIP.zfr2KNlWOiLcVFsiNTYNoAHaHR?pid=ImgDet&rs=1",
  "https://urologiabusto.com/wp-content/uploads/2015/09/her_doctor.jpg",
  "https://th.bing.com/th/id/OIP.DJbw46S2aWnDPzNj7lmdNAHaJ7?pid=ImgDet&w=206&h=275&c=7&dpr=2",
  "https://th.bing.com/th/id/OIP.7r5_lhmm6nxWL7ScBTXvLAHaLJ?w=115&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.K5U_-Z6FkfK0CUrgJqRNEwHaHa?w=165&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.at0gvIb8x4DjQ-Qsk4zV9QHaLG?w=115&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.JxchiAVoniGXhNs8zjwRiAHaLQ?pid=ImgDet&rs=1",
  "https://th.bing.com/th/id/OIP.bFrVNH5ilBjVrllRyRiRFgHaI0?w=155&h=184&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.MHxYih57iYiQNOGV2OFtQwHaLH?w=115&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.D_1Wk3dvLUAtJF613RDvOgHaJq?w=126&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.w7n8avrG7JtLrgHJwognEgHaLD?w=120&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.E7pgi5ra0OojybzbQmogAwHaFk?w=240&h=180&c=7&r=0&o=5&dpr=2&pid=1.7",
  "https://th.bing.com/th/id/OIP.Xb8F13Umor9qB88wkL9f_gHaIb?pid=ImgDet&w=206&h=235&c=7&dpr=2",

  "https://img.freepik.com/free-photo/covid-19-coronavirus-outbreak-healthcare-workers-pandemic-concept-enthusiastic-smiling-male-doctor-glad-help-patients-physician-white-coat-happy-working-clinic-hospital_1258-57450.jpg?w=1480&t=st=1694082779~exp=1694083379~hmac=2533c3f85e417d84ded3a3cc18d447d147ad060052fa6cab58fcd05c6f985dca",
  "https://img.freepik.com/free-photo/doctor-holding-hand-pocket-office_23-2147896185.jpg?size=626&ext=jpg&ga=GA1.2.1737460151.1694081807&semt=ais",
  "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-robe-with-stethoscope-isolated_1303-29803.jpg?size=626&ext=jpg&ga=GA1.1.1737460151.1694081807&semt=ais",
  "https://media.istockphoto.com/id/1371998919/photo/cropped-portrait-of-an-attractive-young-female-doctor-giving-thumbs-up-while-working-in-her.jpg?s=612x612&w=0&k=20&c=5oPD2p5gc7ZQjgyjPAJui9eOGKF8sK_GG6MJpYXmA7s=",
  "https://media.istockphoto.com/id/590242480/photo/the-smile-that-puts-every-patient-at-ease.jpg?s=612x612&w=0&k=20&c=paDwLk3EAqswMydy5QuEk5ipNCNgtfFTPirL6QqtVfM=",
  "https://media.istockphoto.com/id/1148092269/photo/portrait-of-muti-ethnic-doctors.jpg?s=612x612&w=0&k=20&c=4J494TO40-mG6XUdunJOnZAteUy_qLnDnbOrbj6Wn9M=",
  "https://media.istockphoto.com/id/1464901013/photo/senior-woman-doctor-and-portrait-smile-for-healthcare-surgery-or-advice-with-stethoscope-for.jpg?s=612x612&w=0&k=20&c=FLDO3rR9GfeqleThi9OK9fcM3rt0-QlNtJMjifVwAWM=",
  "https://media.istockphoto.com/id/502040635/photo/confident-doctor-with-stethoscope-around-neck.jpg?s=612x612&w=0&k=20&c=ex07ZnkUsytGPx5auvvm3T2DfhQOyR8-ulb-64xnol0=",
  "https://media.istockphoto.com/id/177289714/photo/smiling-male-medical-doctor-wearing-glasses-coat-and-stethoscope.jpg?s=612x612&w=0&k=20&c=Z0mtmBmY5PQPp57-K1OBnbXJGUnuWTPwFrnQ9Wsvl38=",
  "https://media.istockphoto.com/id/1407998038/photo/portrait-of-a-beautiful-female-doctor-in-her-office.jpg?s=612x612&w=0&k=20&c=ZorAnx88Hz01n5JTBZOEwAdhJv6uPma2NoHhGWHffaU="
  ]

  doctor_bio = [
    "Dedicated Pediatric Neurologist, specializing in young patients' neurological health. Committed to improving children's lives through precise diagnosis and compassionate treatment.",
    "Accomplished Cardiac Surgeon with decades of experience. Renowned for advanced heart surgeries and commitment to patient care. A leader in cardiovascular medicine.",
    "Renowned Oncologist making significant contributions to cancer treatment. Compassionate and skilled in diagnosing and treating various cancer types. A pioneer in oncology.",
    "Innovative Dentist at the forefront of oral health advancements. Providing top-quality dental care and promoting healthy smiles. A trusted expert in the field.",
    "Global Health Advocate fighting infectious diseases worldwide. Dedicated to public health and epidemic control. A key player in international healthcare efforts.",
    "Ophthalmology Pioneer advancing eye care with cutting-edge treatments. Expertise in complex eye conditions and vision correction. A leader in ophthalmology.",
    "Reproductive Health Expert empowering women in healthcare choices. Specializing in gynecology and reproductive endocrinology. Compassionate and experienced.",
    "Leading Psychiatrist with a profound impact on mental health. Expert in psychiatric care and therapy. A trusted figure in the field of psychiatry.",
    "Pediatric Cardiology Pioneer enhancing young hearts' well-being. Expertise in diagnosing and treating pediatric heart conditions. A champion for child health.",
    "Renowned Sports Medicine Specialist dedicated to athletes' well-being. Expert in sports-related injuries and performance optimization. A trusted advisor in sports medicine.",
    "Pioneer in Pediatric Oncology, advancing cancer care for children. Specialized in pediatric oncology, providing hope and healing. A dedicated advocate for young patients.",
    "Expert in Geriatric Medicine, specializing in elderly care. Comprehensive approach to senior health and well-being. A trusted advocate for the elderly population.",
    "Dermatology Trailblazer in skincare and dermatological research. Expertise in skin health and innovative treatments. A recognized authority in dermatology.",
    "Visionary in Neurosurgery, known for groundbreaking treatments. Expertise in complex neurological conditions and surgeries. A leader in neurosurgical care.",
    "Leader in Infectious Disease Control, safeguarding public health. Expertise in epidemiology and disease prevention. A trusted authority in infectious diseases.",
    "Pioneer in Gastroenterology, advancing digestive health. Expertise in gastrointestinal disorders and treatments. A leader in the field of gastroenterology.",
    "Expert in Allergy and Immunology, specializing in immune system disorders. Expertise in diagnosing and managing allergies and immunological conditions.",
    "Leader in Emergency Medicine, specializing in critical care. Rapid assessment and treatment of medical emergencies, saving lives. A trusted figure in emergency medicine.",
    "Pioneer in Integrative Medicine, blending healthcare approaches. Expertise in holistic health and personalized care. A respected authority in integrative medicine.",
    "Nephrologist specializing in kidney care. Dedicated to renal health and disease management. A trusted expert in nephrology.",
    "Plastic Surgeon enhancing appearance and confidence. Renowned for aesthetic procedures and surgical expertise. A trusted figure in plastic surgery.",
    "Orthopedic Surgeon specializing in musculoskeletal conditions. Expertise in diagnosing and treating orthopedic injuries and disorders. A leader in orthopedics.",
    "Gynecologist focusing on women's health. Comprehensive care and support for women's unique healthcare needs. A trusted advocate for women's health.",
    "Rheumatologist specializing in autoimmune disorders. Expertise in diagnosing and managing rheumatic diseases. A trusted figure in rheumatology.",
    "Hematologist-Oncologist in blood cancer care. Dedicated to cancer diagnosis and treatment. A leader in hematology-oncology.",
    "Radiologist using imaging for precise diagnosis. Expert in medical imaging techniques and interpretations. A trusted authority in radiology.",
    "Urologist treating urinary tract conditions. Expertise in urological health and surgical procedures. A trusted figure in urology.",
    "Pulmonologist for respiratory health. Comprehensive care for respiratory conditions and lung diseases. A respected authority in pulmonology.",
    "Endocrinologist managing hormone disorders. Expertise in hormonal health and treatments. A trusted figure in endocrinology.",
    "Neonatologist caring for newborns. Specialized in neonatal care and infant health. A dedicated advocate for newborns and their families.",
    "Psychosomatic Medicine Specialist in mind-body health. Holistic approach to mental and physical well-being. A trusted expert in psychosomatic medicine.",
    "Infectious Disease Specialist for infections. Expertise in diagnosing and treating infectious diseases. A trusted authority in infectious disease care.",
    "Hepatologist specializing in liver diseases. Comprehensive care for liver conditions and liver transplantation. A respected figure in hepatology.",
    "Family Medicine Practitioner providing comprehensive care. Trusted for primary healthcare needs and preventive medicine. A pillar of family medicine.",
    "Neurologist for neurological disorders. Expertise in diagnosing and managing neurological conditions. A trusted figure in neurology.",
    "Interventional Cardiologist performing advanced heart procedures. Expertise in cardiac interventions and cardiovascular care. A leader in cardiology.",
    "Clinical Geneticist diagnosing genetic conditions. Expertise in genetic disorders and counseling. A trusted authority in clinical genetics.",
    "Rheumatology Fellow researching autoimmune diseases. Dedicated to advancing rheumatic disease knowledge and treatment. A rising star in rheumatology research.",
    "Gastrointestinal Surgeon specializing in GI surgery. Expertise in complex gastrointestinal surgeries. A trusted figure in gastrointestinal surgery.",
    "Pain Management Specialist alleviating chronic pain. Expertise in pain diagnosis and treatment. A compassionate advocate for pain relief.",
    "Neuro-Oncologist treating brain cancers. Expertise in diagnosing and treating brain tumors. A dedicated champion for brain cancer patients.",
    "Thoracic Surgeon focusing on chest surgery. Expertise in thoracic surgeries and treatments. A trusted figure in thoracic surgery.",
    "Intensive Care Physician providing critical care. Skilled in managing critically ill patients and life-saving interventions. A compassionate leader in critical care.",
    "Vascular Surgeon for circulatory conditions. Expertise in vascular surgeries and interventions. A trusted authority in vascular surgery.",
    "Dental Surgeon performing oral surgeries. Renowned for dental surgical procedures and expertise. A trusted figure in dental surgery.",
    "Plastic Surgery Fellow specializing in cosmetic procedures. Dedicated to aesthetic enhancements and patient satisfaction. A rising star in plastic surgery.",
    "Child Psychiatrist supporting young mental health. Expert in child and adolescent psychiatry. A compassionate advocate for young patients' well-being.",
    "Pediatric Anesthesiologist ensuring pain-free surgeries. Expertise in pediatric anesthesia and pain management. A trusted figure in pediatric anesthesiology.",
    "Dermatopathologist diagnosing complex skin diseases. Expert in dermatopathology and precise diagnostics. A trusted authority in dermatopathology.",
    "Neurological Surgeon performing complex brain surgeries. Expertise in intricate neurological procedures. A leader in neurological surgery.",
    "Trauma Surgeon for critical injuries. Specialized in trauma care and life-saving surgeries. A trusted figure in trauma surgery.",
    "Virologist studying viruses and infections. Expertise in virology research and infectious"
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
    bio: doctor_bio.sample,
    phone_number: Faker::PhoneNumber.cell_phone,
    image_url: doctor_img.sample,
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
