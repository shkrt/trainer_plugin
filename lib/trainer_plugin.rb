require "trainer_plugin/engine"

module TrainerPlugin
  def track(name, id, hash, time)
    AhoyWorker.perform_async(name, id, hash, time)
  end
end
