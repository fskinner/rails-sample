FactoryGirl.define do
  factory :rent do
    sequence(:value) {|n| n }
    sequence(:date) {|n| DateTime.now }
  end
end