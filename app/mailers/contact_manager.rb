class ContactManager < ActionMailer::Base
  default from: "managers@windsormanor.net"
	def contact_email email
		@body_text = email[:message]
		@name = email[:name]
	end
end
 