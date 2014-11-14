class MaintenanceMailer < ActionMailer::Base
  default from: "managers@windsormanor.net"
	def maintenance_email maintenance
		@tenant_name = maintenance[:tenant_name]
		@tenant_phone = maintenance[:tenant_phone]
		@location = maintenance[:location]
		@description = maintenance[:description]
		mail(to: 'manager@windsormanor.net', subject: "#{@name} has reached out to you")
	end
end
 