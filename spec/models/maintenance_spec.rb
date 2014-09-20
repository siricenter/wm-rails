# == Schema Information
#
# Table name: maintenances
#
#  id           :integer          not null, primary key
#  tenant_name  :string(255)
#  building_id  :integer
#  location     :string(255)
#  description  :string(255)
#  tenant_phone :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Maintenance, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
