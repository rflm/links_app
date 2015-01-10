# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "exmpl usr", email:"usr@example.com", 
  password: "password", password_confirmation: "password")

99.times do |n|
  title = Faker::Lorem.sentence
  url = Faker::Internet.url
  description = Faker::Lorem.paragraph
  Link.create!(title: title, url: url, 
    description: description)

  name = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  User.create!(name: name, email: email, 
    password: password, password_confirmation: password)

end

50.times do |n|
  link = Link.first
  content = Faker::Lorem.sentence
  link.comments.create!(content: content)
  
end