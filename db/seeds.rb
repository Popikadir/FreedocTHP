# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Patient.destroy_all
puts "La liste des patients précédente a été supprimé avec succès."
100.times do |pa|
	Patient.create!(
	  first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    city: City.all.sample
  )
    pa += 1
    puts "Patient #{pa}/100 créé avec succès"
end

Doctor.destroy_all
puts "La liste des Docteurs précédente a été supprimé avec succès."
45.times do |doc|
  Doctor.create!(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    #specialty: Specialty.all.sample,
    zip_code:Faker::Number.decimal_part(digits: 5),
    city: City.all.sample
  )
  doc += 1
  puts "Docteur #{doc}/45 créé avec succès"
end

Appointment.destroy_all
puts "La liste des Rendez-vous précédente a été supprimé avec succès."
100.times do |ap|
  Appointment.create!(doctor: Doctor.all.sample, patient: Patient.all.sample, date: Faker::Time.between_dates(from: Date.today - 1000, to: Date.today + 45, period: :day), city: City.all.sample)
  ap += 1
  puts "Rendez-vous #{ap}/100 créé avec succès"
end

City.destroy_all
puts "La liste des Villes précédente a été supprimé avec succès."
10.times do |ci|
  City.create!(name:Faker::Address.city)
  ci += 1
  puts "Ville #{ci}/10 créée avec succès"
end

Specialty.destroy_all
20.times do |x|
  Specialty.create!(name: ["Chirurgien", "Généraliste", "Orthophoniste", "Dentiste", "Ophtalmologue", "Psychiatre", "Kinésithérapeute"].sample)
  x += 1
  puts "Spécialité #{x}/20 créée"
end

DoctorSpecialty.destroy_all 
20.times do |x|
  DoctorSpecialty.create!(doctor: Doctor.all.sample, specialty: Specialty.all.sample)
  x += 1
  puts "Spécialité #{x}/20 associé à un docteur"
end 