FactoryGirl.define do
  factory :user do
    email { Faker::Internet.free_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    password "12345678"
    birthday {Faker::Date.birthday(18, 65)}
    avatar { Faker::Avatar.image }

  end
end
