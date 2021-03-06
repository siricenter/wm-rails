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

require 'rest_client'

class Gallery < ActiveRecord::Base
  validates :image_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
  
  before_destroy :backupItem
  after_destroy :deleteItem
  
  # saves the item id before destroying
  def backupItem
    @public_id = self.image_id.split('/').last
    @public_id = @public_id.split('#').first
    @public_id = @public_id.split('.').first
  end
  
  # after destroying the image from the db this will remove it from cloudinary
  def deleteItem
    Cloudinary::Uploader.destroy(@public_id)
  end
  
end
