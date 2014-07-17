class CreateBuildings < ActiveRecord::Migration
	def change
		create_table :buildings do |t|
			t.string :name

			t.timestamps
		end

		remove_column :apartments, :building, :reference

		add_column :apartments, :building_id, :integer, references: :buildings
	end
end
