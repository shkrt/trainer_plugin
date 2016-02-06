require "trainer_plugin/engine"

module TrainerPlugin
  def track(name, id)
    AhoyWorker.perform_async(name, id, Time.now)
  end
end
