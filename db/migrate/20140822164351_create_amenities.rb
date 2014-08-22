class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :title
      t.string :img_id
      t.string :img_desc

      t.timestamps
    end
  end
end
