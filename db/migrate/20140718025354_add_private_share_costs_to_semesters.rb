class AddPrivateShareCostsToSemesters < ActiveRecord::Migration
  def change
    add_column :semesters, :private_cost, :integer
    add_column :semesters, :shared_cost, :integer
    add_column :semesters, :deposit, :integer
  end
end
