FactoryGirl.define do
  factory :history do
    sequence(:message) {|n| "history-#{n}" }
    sequence(:value) {|n| n }
    sequence(:transaction_type) {|n| "transaction-#{n}" }
    rent
  end
end