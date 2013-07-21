FactoryGirl.define do
  factory :game_sample do
    sequence(:identifier) {|n| "identifier-#{n}" }
    sequence(:available) { true }
	game
  end
end