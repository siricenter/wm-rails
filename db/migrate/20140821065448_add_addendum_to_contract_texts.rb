class AddAddendumToContractTexts < ActiveRecord::Migration
  def change
    add_column :contract_texts, :addendum, :text
  end
end
