class AhoyWorker
  include Sidekiq::Worker
  def perform(tag, uid, time)
    Ahoy::Event.create(id: SecureRandom.uuid, user_id: uid, name: tag, time: time)
  end
end
