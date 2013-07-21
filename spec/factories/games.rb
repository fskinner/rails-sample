FactoryGirl.define do
  factory :game do
    sequence(:name) {|n| "game-#{n}" }
    price_range
    console
    gender
  end
end