# == Schema Information
#
# Table name: apartments
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image_id    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  building_id :integer
#

class Apartment < ActiveRecord::Base
	belongs_to :building

	validates :image_id, presence: true
	validates :title, presence: true
	validates :description, presence: true

	before_destroy :backupItem
	after_destroy :deleteItem

	validates_presence_of :building

	# saves the item id before destroying
	def backupItem
		if self.image_id
			@public_id = self.image_id.split('/').last
			@public_id = @public_id.split('#').first
			@public_id = @public_id.split('.').first
		end
	end

	# after destroying the image from the db this will remove it from cloudinary
	def deleteItem
		if @public_id
			Cloudinary::Uploader.destroy(@public_id)
		end
	end
end
