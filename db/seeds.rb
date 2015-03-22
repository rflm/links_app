# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(name: "John", email: "john@example.com",
  password: "password", password_confirmation: "password")

title = "Wikipedia, the free encyclopedia"
url = "http://en.wikipedia.org/wiki/Main_Page"
thumbnail_url = "https://tctechcrunch2011.files.wordpress.com/2010/05/wikipedia1.png"
description = "The free encyclopedia"

user.links.create!(title: title, url: url,
  thumbnail_url: thumbnail_url, description: description)


=begin

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
  user = User.all.sample
  title = Faker::Lorem.sentence
  url = Faker::Internet.url
  description = Faker::Lorem.paragraph
  link = user.links.create!(title: title, url: url, 
    description: description)

  (1..100).to_a.sample.times do |i|
    commenter = User.all.sample
    content = Faker::Lorem.sentence
    link.comments.create!(content: content, user: commenter)
  end

  voters = User.all.sample((1..User.count).to_a.sample).to_a  # picks table of random users
  voters.each do |i|
    link.add_evaluation(:votes, [-1,1].sample, i)
  end
end

=end