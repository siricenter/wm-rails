class CreateContractTexts < ActiveRecord::Migration
  def change
    create_table :contract_texts do |t|
      t.text :contract
      t.text :living_standards
      t.text :parking_acknowledgement
      t.text :eligibility

      t.timestamps
    end
  end
end
