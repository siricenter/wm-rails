class RemoveCostsFromSemesters < ActiveRecord::Migration
  def change
    remove_column :semesters, :private_cost, :integer
    remove_column :semesters, :shared_cost, :integer
  end
end
