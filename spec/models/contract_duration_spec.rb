# == Schema Information
#
# Table name: contract_durations
#
#  id          :integer          not null, primary key
#  start_date  :date
#  end_date    :date
#  semester_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe ContractDuration, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
