FactoryGirl.define do 
  factory :link do |f|
    f.title { Faker::Lorem.sentence }
    f.url { Faker::Internet.url }
    f.description { Faker::Lorem.paragraph }
  end

  factory :invalid_link, class: Link do |f|
    f.title nil
    f.url nil
    f.description nil
  end
end