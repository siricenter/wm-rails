class RemoveDatesFromSemester < ActiveRecord::Migration
  def change
    remove_column :semesters, :start_date, :date
    remove_column :semesters, :end_date, :date
  end
end
