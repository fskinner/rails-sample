FactoryGirl.define do
  factory :devolution do
    sequence(:date) {|n| DateTime.now }
    sequence(:midia_status) {|n| n }
  end
end