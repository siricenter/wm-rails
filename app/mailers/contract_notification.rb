class ContractNotification < ActionMailer::Base
	default from: "managers@windsormanor.net"
	default to: Proc.new {Admin.pluck(:email)}

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	#   en.contract_notification.contract_saved.subject
	#
	def contract_saved contract
		@contract = contract

		mail to: 'CJPoll@gmail.com',#['managers@windsormanor.net', @contract.email],
			subject: 'Your Receipt for Windsor Manor'
	end
end
