# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do 
	name = Faker::Name.name
	email = Faker::Internet.email
	phone_number = Faker::PhoneNumber.phone_number
	password = "taylorswift"
	role = ["support", "regular"].shuffle.first
	status = ["fixed", "open", "closed"].shuffle.first
	description = Faker::Lorem.paragraphs(3)

	user = User.create!(name: name, email: email, phone_number: phone_number, password: password, password_confirmation: password, role: role)
	user.cases.create!(description: description, status: status) 
end
