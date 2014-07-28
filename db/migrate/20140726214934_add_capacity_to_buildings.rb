class AddCapacityToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :capacity, :integer
  end
end
