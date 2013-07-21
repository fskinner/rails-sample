FactoryGirl.define do
  factory :price_range do
    sequence(:price) {|n| n }
    sequence(:decrement_value) {|n| n }
    sequence(:category) {|n| "category-#{n}" }
  end
end