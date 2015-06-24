class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.integer :time_for_takeoff
      t.string :status
      t.string :name

      t.timestamps null: false
    end
  end
end
