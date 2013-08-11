# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) {|n| "scott#{n}@forrestbice.com"}
  sequence(:username) {|n| "NateHolmes#{n}"}
  

  factory :user do
    email
    username
    password "nathan123"
    password_confirmation "nathan123"
  end
end
