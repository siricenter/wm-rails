class CreateStudyReservations < ActiveRecord::Migration
  def change
    create_table :study_reservations do |t|
      t.references :study_room, index: true
      t.time :start
      t.time :stop
      t.date :date
      t.string :name

      t.timestamps
    end
  end
end
