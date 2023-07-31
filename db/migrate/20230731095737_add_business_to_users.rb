class AddBusinessToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :business, :string
  end
end
