class Plane < ActiveRecord::Base
	has_many :histories

	STATUSES = %w(in_queue on_takeoff in_flight)

	scope :available, -> { where(status: nil) }

	before_update :status_was_changed, if: -> { status_changed? }

	private

    def status_was_changed
    	histories.create(value: status)

    	return if status != "in_queue"
    	PlaneQueue.create(plane_id: self.id)
    	PlanesQueueWorker.perform_async()
    end
end
