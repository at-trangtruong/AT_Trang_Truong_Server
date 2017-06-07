FactoryGirl.define do
  factory :user do
    id { Faker::Code }
    email { Faker::Internet.free_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    password "12345678"
    birthday {Faker::Date.birthday(18, 65)}
    avatar { Faker::Avatar.image }
    sex {Faker::Name.first_name}
    session_time(Faker::Date.birthday)
    auth_token (SecureRandom.hex)
  end
end
