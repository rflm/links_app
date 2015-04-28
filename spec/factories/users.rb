FactoryGirl.define do
  factory :user do |f|
    f.name Faker::Name.name
    f.email 'example@email.com'
    f.password 'password'
    f.password_confirmation 'password'
  end

  factory :admin, class: User do |f|
    f.name 'admin'
    f.email 'admin@email.com'
    f.password 'password'
    f.password_confirmation 'password'
    f.admin true
  end

  factory :invalid_user, class: User do |f|
    f.name nil
    f.email nil
  end
end
