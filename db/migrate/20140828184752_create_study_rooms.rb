class CreateStudyRooms < ActiveRecord::Migration
  def change
    create_table :study_rooms do |t|
      t.references :building, index: true
      t.string :rm_type
      t.integer :rm_number
      t.integer :floor

      t.timestamps
    end
  end
end
