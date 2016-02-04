class AhoyWorker
  include Sidekiq::Worker
  def perform(tag, uid, props, time)
    Ahoy::Event.create(id: SecureRandom.uuid, user_id: uid, name: tag,
                       properties: props, time: time)
  end
end
