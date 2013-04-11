FactoryGirl.define do
  factory :console do
    sequence(:name) {|n| "console-#{n}" }
  end
end