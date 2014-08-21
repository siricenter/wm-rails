class AddContractTextToContract < ActiveRecord::Migration
	def change
		add_reference :contracts, :contract_text, index: true
	end
end
