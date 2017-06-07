FactoryGirl.define do
  factory :comment do
    id { Faker::Code }
    user_id{Faker::Code}
    article_id{Faker::Code}
    content {Faker::Name.first_name}
  end
end
