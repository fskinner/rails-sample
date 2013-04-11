FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "person-#{n}" }
    sequence(:email) {|n| "person-#{n}@example.com" }
    sequence(:password) {|n| "password-#{n}" }

    sequence(:street) {|n| "street-#{n}" }
    sequence(:city) {|n| "city-#{n}" }
    sequence(:state) {|n| "state-#{n}" }
    sequence(:zipcode) {|n| "zipcode-#{n}" }

  end
end