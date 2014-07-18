class RemoveParkingTable < ActiveRecord::Migration
	def change
#		drop_table :parking_spots
		add_column :contracts, :parking_type, :string
	end
end
