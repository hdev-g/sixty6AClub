class AddCapacityToDesk < ActiveRecord::Migration[7.0]
  def change
    add_column :desks, :capacity, :integer
  end
end
