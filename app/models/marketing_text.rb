class MarketingText < ActiveRecord::Base
	validates :text, presence: true
end
