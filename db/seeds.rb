20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  avatar = Faker::Avatar.image
  description = Faker::Lorem.paragraph
  User.create!(name: name, email: email, 
    password: password, password_confirmation: password,
    avatar: avatar, description: description)

end

50.times do |n|
  user = User.all.sample
  title = Faker::Lorem.sentence
  url = Faker::Internet.url
  description = Faker::Lorem.paragraph
  thumbnail_url = Faker::Avatar.image

  link = user.links.create!(title: title, url: url, 
    description: description, thumbnail_url: thumbnail_url)

  (1..20).to_a.sample.times do |i|
    commenter = User.all.sample
    content = Faker::Lorem.sentence
    link.comments.create!(content: content, user: commenter)
  end

  voters = User.all.sample((1..User.count).to_a.sample).to_a  # picks table of random users
  voters.each do |i|
    link.add_evaluation(:votes, [-1,1].sample, i)
  end
end