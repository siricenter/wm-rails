class AddPaymentDateToContractDurations < ActiveRecord::Migration
  def change
    add_column :contract_durations, :payment_due, :date
  end
end
