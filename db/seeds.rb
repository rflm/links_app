# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Random.new

User.create!(name: "admin", email:"admin@email.com", 
  password: "password", password_confirmation: "password",
  admin: true)

49.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  avatar = Faker::Avatar.image
  description = Faker::Lorem.paragraph
  User.create!(name: name, email: email, 
    password: password, password_confirmation: password,
    avatar: avatar, description: description)

end

99.times do |n|
  user = User.find(r.rand(1..50))
  title = Faker::Lorem.sentence
  url = Faker::Internet.url
  description = Faker::Lorem.paragraph
  user.links.create!(title: title, url: url, 
    description: description)

end

50.times do |n|
  user = User.find(r.rand(1..50))
  link = Link.first
  content = Faker::Lorem.sentence
  link.comments.create!(content: content, user: user)
  
end