# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    association :user
    association :track
    body "LOL WUT"
  end
end
