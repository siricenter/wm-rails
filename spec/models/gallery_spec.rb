# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  image_id    :string(255)
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Gallery, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
