class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.string :letter
      t.references :apartment, index: true

      t.timestamps
    end
  end
end
