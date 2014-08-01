namespace :windsor_manor do
  desc "TODO"
  task send_contract_emails: :environment do
	  @contracts = Contract.all
	  @contracts.each do |contract|
		ContractNotification.contract_saved(contract).deliver
	  end
  end

end
