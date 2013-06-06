FactoryGirl.define do
  factory :history do
    sequence(:message) {|n| "history-#{n}" }
    sequence(:value) {|n| n }
    sequence(:transaction_type) {|n| "transaction-#{n}" }
    sequence(:currency) {|n| "currency-#{n}" }
    sequence(:date) {|n| DateTime.now }
    rent
  end
end