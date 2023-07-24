class CreateDesks < ActiveRecord::Migration[7.0]
  def change
    create_table :desks do |t|
      t.string :type
      t.integer :location
      t.integer :price

      t.timestamps
    end
  end
end
