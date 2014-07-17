class CreateContracts < ActiveRecord::Migration
	def change
		create_table :contracts do |t|
			t.references :semester
			t.references :apartment

			t.string :first_name
			t.string :last_name
			t.string :email
			t.string :home_address_1
			t.string :home_address_2
			t.string :home_city
			t.string :home_state
			t.string :home_zip
			t.string :room_type

			t.timestamps
		end
	end
end
