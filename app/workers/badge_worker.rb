class BadgeWorker
  include Sidekiq::Worker
  #
  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      Merit::Action.check_unprocessed
    end
  end
end
