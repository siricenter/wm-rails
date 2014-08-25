class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.string :tenant_name
      t.references :building, index: true
      t.string :location
      t.string :description
      t.string :tenant_phone

      t.timestamps
    end
  end
end
