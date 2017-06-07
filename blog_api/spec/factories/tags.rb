FactoryGirl.define do
  factory :tag do
    id { Faker::Code }
    name {Faker::Name.first_name}
  end
end
