require "trainer_plugin/engine"

module TrainerPlugin
  def track(name, id)
    AhoyTrackJob.perform_later(name, id, Time.now.to_s)
  end
end
