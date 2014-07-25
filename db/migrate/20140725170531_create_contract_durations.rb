class CreateContractDurations < ActiveRecord::Migration
  def change
    create_table :contract_durations do |t|
      t.date :start_date
      t.date :end_date
      t.references :semester, index: true

      t.timestamps
    end
  end
end
