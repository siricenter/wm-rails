# == Schema Information
#
# Table name: contract_texts
#
#  id                      :integer          not null, primary key
#  contract                :text
#  living_standards        :text
#  parking_acknowledgement :text
#  eligibility             :text
#  created_at              :datetime
#  updated_at              :datetime
#  addendum                :text
#

class ContractText < ActiveRecord::Base
	has_many :contracts
end
