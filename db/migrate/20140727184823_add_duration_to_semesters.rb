class AddDurationToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :duration, :integer
  end
end
