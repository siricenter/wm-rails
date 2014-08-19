class RemoveDurationsTable < ActiveRecord::Migration
  def change
	  add_column :semesters, :start_date, :date
	  add_column :semesters, :end_date, :date

	  drop_table :contract_durations do
		  add_column :semesters, :start_date, :date
		  add_column :semesters, :end_date, :date
		  add_column :semesters, :payment_due, :date
	  end
  end
end
