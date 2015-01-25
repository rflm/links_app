FactoryGirl.define do
  factory :comment do |f|
    f.content Faker::Lorem.paragraph
  end
end
