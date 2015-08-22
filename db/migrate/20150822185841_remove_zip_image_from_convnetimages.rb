class RemoveZipImageFromConvnetimages < ActiveRecord::Migration
  def change
  	remove_attachment :convnetimages, :zip_image
  end
end
