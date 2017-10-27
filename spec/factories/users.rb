# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email 'test@test.com'
    password_digest '12345'

    factory :user_with_events do
      after(:create) do |user|
        create(:card_review_event, user: user)
        create(:card_addition_event, user: user)
      end
    end
  end
end
