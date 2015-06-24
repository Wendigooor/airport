class CreatePlaneQueues < ActiveRecord::Migration
  def change
    create_table :plane_queues do |t|
      t.integer :plane_id

      t.timestamps
    end
  end
end
