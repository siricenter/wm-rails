class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :number
      t.integer :bed_count
      t.integer :floor
      t.string :building

      t.timestamps
    end
  end
end
