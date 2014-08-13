class CreateContractsSemestersTable < ActiveRecord::Migration
  def change
    create_table :contracts_semesters do |t|
      t.references :contract, index: true
      t.references :semester, index: true
    end
  end
end
