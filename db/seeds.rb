# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Gail Ducao",
	email: "gail@gmail.com",
	password: "gail123",
  password_confirmation: "gail123",
  admin: true)


Category.create(title:"C+",
  description:
  "A basic programming language for you and for me and for the entire world")

30.times do |n|
  name = Faker::Name.name
  email= "example-#{n+1}@rails.com"
  password = "password"
  User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password)
end

50.times do |n|
  title = Faker::Name.unique.name
  description = "A basic programming language for you and for me and for the entire world"
  Category.create!(title: title,description: description)
end