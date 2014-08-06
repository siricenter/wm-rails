require "rails_helper"

RSpec.describe ContractNotification, :type => :mailer do
	describe "contract_saved" do
		let(:contract) {FactoryGirl.create(:contract)}
		let(:mail) {ContractNotification.contract_saved(contract)}

		it "renders the headers" do
			expect(mail.subject).to eq("Your Receipt for Windsor Manor")
			expect(mail.to).to eq(['managers@windsormanor.net', contract.email])
			expect(mail.from).to eq(["managers@windsormanor.net"])
		end

		it "renders the body" do
			expect(contract).to_not be_nil
			expect(contract.parking_type).to eq('Private Uncovered')
			expect(mail.body.encoded).to match("trusting")
		end
	end

end
