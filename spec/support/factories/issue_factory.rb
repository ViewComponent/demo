FactoryBot.define do
  factory :issue do
    title { SecureRandom.hex }
    open

    trait :open do
      state { "open" }
    end

    trait :closed do
      state { "closed" }
    end

    trait :with_pull_request do
      pull_request
    end
  end
end
