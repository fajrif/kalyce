# Doctor
Doctor.delete_all

puts "create doctors"
# Doctor
d = Doctor.new(full_name: "Jane Doe", profesional_name: "dr. Jane Doe Sp.DVE", email: "jane.doe@kalyce.com")
d.phone = FFaker::PhoneNumber.phone_number
d.title = "Aesthetic - Dipl. ECARE, CH, CHt"
d.str_no = "STR-500020300032"
d.content = FFaker::Lorem.paragraphs(rand(3)+2).join(" ")
d.photo.attach(io: File.open(Rails.root.join("vendor/assets/images/doctors/doctor1.png")), filename: "doctor1.png")
d.specialists << Specialist.first
d.save!
sc = d.schedules.build(day_code: 1, start_time: "15:00", end_time: "18:00")
sc.save!
sc = d.schedules.build(day_code: 3, start_time: "15:00", end_time: "18:00")
sc.save!
sc = d.schedules.build(day_code: 5, start_time: "15:00", end_time: "18:00")
sc.save!
sc = d.schedules.build(day_code: 6, start_time: "07:00", end_time: "09:00")
sc.save!

# Doctor
d = Doctor.new(full_name: "John Doe", profesional_name: "dr. John Doe Sp.DVE", email: "john.doe@kalyce.com")
d.phone = FFaker::PhoneNumber.phone_number
d.title = "Aesthetic - Dipl. ECARE, CH, CHt"
d.str_no = "STR-500020300032"
d.content = FFaker::Lorem.paragraphs(rand(3)+2).join(" ")
d.photo.attach(io: File.open(Rails.root.join("vendor/assets/images/doctors/doctor2.png")), filename: "doctor2.png")
d.specialists << Specialist.first
d.save!
sc = d.schedules.build(day_code: 2, start_time: "17:00", end_time: "18:30")
sc.save!

# Doctor
d = Doctor.new(full_name: "Janes Doe", profesional_name: "dr. Janes Doe Sp.DVE", email: "janes.doe@kalyce.com")
d.phone = FFaker::PhoneNumber.phone_number
d.title = "Aesthetic - Dipl. ECARE, CH, CHt"
d.str_no = "STR-500020300032"
d.content = FFaker::Lorem.paragraphs(rand(3)+2).join(" ")
d.photo.attach(io: File.open(Rails.root.join("vendor/assets/images/doctors/doctor3.png")), filename: "doctor3.png")
d.specialists << Specialist.first
d.save!
sc = d.schedules.build(day_code: 1, start_time: "09:00", end_time: "11:00")
sc.save!
sc = d.schedules.build(day_code: 2, start_time: "09:00", end_time: "11:00")
sc.save!
sc = d.schedules.build(day_code: 3, start_time: "09:00", end_time: "11:00")
sc.save!
sc = d.schedules.build(day_code: 4, start_time: "09:00", end_time: "11:00")
sc.save!
