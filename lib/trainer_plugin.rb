require "trainer_plugin/engine"

module TrainerPlugin
  class Configuration
    attr_accessor :user_class
  end

  class << self
    attr_reader :config

    def configure
      @config = Configuration.new
      yield @config
    end
  end

  def track(name, id)
    AhoyTrackJob.perform_later(name, id, Time.now.to_s)
  end
end
