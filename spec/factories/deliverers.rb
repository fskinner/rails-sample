FactoryGirl.define do
  factory :deliverer do
    sequence(:date) {|n| DateTime.now }
  end
end