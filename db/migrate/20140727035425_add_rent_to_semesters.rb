class AddRentToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :rent, :integer
  end
end
