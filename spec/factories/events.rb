# frozen_string_literal: true

FactoryGirl.define do
  factory :event, class: Ahoy::Event do
    time Time.now
    properties {}

    factory :card_review_event do
      id SecureRandom.uuid
      name 'card was reviewed'
    end

    factory :user_registration_event do
      id SecureRandom.uuid
      name 'user registered'
    end

    factory :card_addition_event do
      id SecureRandom.uuid
      name 'card was added'
    end

    factory :flickr_link_event do
      id SecureRandom.uuid
      name 'image from flickr was linked'
    end

    factory :ordinary_login_event do
      id SecureRandom.uuid
      name 'user logged in'
    end

    factory :oauth_login_event do
      id SecureRandom.uuid
      name 'user logged in via oauth'
    end
  end
end
