class User < ActiveRecord::Base
  has_many :ahoy_events, class_name: "Ahoy::Event"
end
