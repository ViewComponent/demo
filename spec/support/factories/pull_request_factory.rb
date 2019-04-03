FactoryBot.define do
  factory :pull_request do
    trait :merged do
      merged_at { DateTime.now }
    end

    trait :draft do
      draft { true }
    end
  end
end
