FactoryGirl.define do
  factory :category do
    id { Faker::Code }
    name {Faker::Name.first_name}
  end
end
