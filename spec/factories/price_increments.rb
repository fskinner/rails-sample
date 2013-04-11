FactoryGirl.define do
  factory :price_increment do
    sequence(:value) {|n| n }
  end
end