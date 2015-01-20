FactoryGirl.define do 
  factory :user do |f|
    f.id 1
    f.name Faker::Name.name
    f.email "example@email.com"
    f.password "password"
    f.password_confirmation "password"
  end

  factory :admin, class: User do |f|
    f.name "admin"
    f.email "admin@email.com"
    f.password "password"
    f.password_confirmation "password"
    f.admin true
  end
end