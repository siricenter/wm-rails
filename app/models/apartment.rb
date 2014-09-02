class Apartment < ActiveRecord::Base
  validates :image_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
  
  before_destroy :backupItem
  after_destroy :deleteItem
  
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
