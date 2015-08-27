class CountWorker
  include Sidekiq::Worker

  def perform(location_id)
    location = Location.find_by_id(location_id)
    location.update_counts
  end


end
