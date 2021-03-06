class ContactManager < ActionMailer::Base
  default from: "managers@windsormanor.net"
	def contact_email email
		@body_text = email[:message]
		@name = email[:name]
		@return_address = email[:return_address]
		mail(to: 'manager@windsormanor.net', subject: "#{@name} has reached out to you")
	end
end
 