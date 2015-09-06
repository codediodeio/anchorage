class BadgeWorker
  include Sidekiq::Worker

  def perform
    Merit::Action.check_unprocessed
  end
end
