# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'teamcovid02#', password_confirmation: 'teamcovid02#') if Rails.env.development?
AdminUser.create!(email: 'admin_test@example.com', password: 'covidtest', password_confirmation: 'covidtest')
institute = Institute.create!(name: "test", address: "test address")
section = Section.create!(institute_id: institute.id, name: "coffee shop")
User.create!(name: "Test user", email: "test@example.com", password: "testpass", institute_id: institute.id, section_id: section.id, reports: true)