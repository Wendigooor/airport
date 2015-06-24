class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :value
      t.integer :plane_id

      t.timestamps
    end
    add_index :histories, :plane_id
  end
end
