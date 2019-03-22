FactoryBot.define do

  factory :reaction do
    for_post
    trait :for_post do
      like {true}
      resource_type {'Post'}
      resource_id {2}
      user
    end

    trait :for_comment do
      dislike {true}
      resource_type {'Comment'}
      resource_id {2}
      user
    end
  end

  factory :friend do
    user
  end

  factory :comment do
    content {Faker::Lorem.paragraph}
    post
    user
  end
  
  factory :post do
    content {Faker::Lorem.paragraph}
    user
  end

  factory :user do
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    dob {Faker::Date.between(100.years.ago, 10.years.ago)}
    password {Faker::String.random(6..12)}
    gender {Faker::Gender.binary_type}

  end


end
