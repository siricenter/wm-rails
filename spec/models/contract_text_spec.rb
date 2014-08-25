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

require 'rails_helper'

RSpec.describe ContractText, :type => :model do
  subject {FactoryGirl.build :contract_text}
  
end
