class PlanesQueueWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: false

  def perform
  	return if Rails.cache.read('airport_is_busy')
  	return if PlaneQueue.first.nil?

    plane = PlaneQueue.first.plane
    plane.update_attributes(status: "on_takeoff")
    Rails.cache.write('airport_is_busy', true)
    PlaneFlightWorker.delay_for(plane.time_for_takeoff.to_i.second).perform_async(plane.id)
  end
end
