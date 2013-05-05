FactoryGirl.define do
  factory :game do
    sequence(:name) {|n| "game-#{n}" }
    sequence(:available) { true }
    price_range
    console
    gender
  end
end