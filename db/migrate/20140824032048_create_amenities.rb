class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :image_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
