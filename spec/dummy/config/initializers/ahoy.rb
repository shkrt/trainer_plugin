if Rails.env.test?
  require 'ahoy/stores/base_store'
  require 'ahoy/stores/active_record_store'
end

class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
end
