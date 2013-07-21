FactoryGirl.define do
  factory :rent do
    sequence(:initial_value) {|n| n }
    sequence(:decrement_value) {|n| n }
    sequence(:date) {|n| DateTime.now }
    game
    user
  end
end