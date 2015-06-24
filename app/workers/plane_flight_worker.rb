class PlaneFlightWorker
  include Sidekiq::Worker
  sidekiq_options queue: :plane_actions, retry: false

  def perform(id)
	plane = Plane.find(id)
    plane.update_attributes(status: "in_flight")
    PlaneQueue.destroy_all(plane_id: id)
    Rails.cache.write('airport_is_busy', false)
    PlanesQueueWorker.perform_async()
  end
end
