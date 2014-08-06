namespace :windsor_manor do
  desc "Emails all students who have contracts"
  task send_contract_emails: :environment do
	  @contracts = Contract.all
	  @contracts.each do |contract|
		ContractNotification.contract_saved(contract).deliver
	  end
  end

end
