# == Schema Information
#
# Table name: marketing_texts
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MarketingText < ActiveRecord::Base
	validates :text, presence: true
end
