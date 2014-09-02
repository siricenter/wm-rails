class CreateHappenings < ActiveRecord::Migration
  def change
    create_table :happenings do |t|
      t.string :heading
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
