class RemoveSemesterIdFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :semester_id, :integer
  end
end
