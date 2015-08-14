class AddAttachmentZipImageToConvnetimages < ActiveRecord::Migration
  def self.up
    change_table :convnetimages do |t|
      t.attachment :zip_image
    end
  end

  def self.down
    remove_attachment :convnetimages, :zip_image
  end
end
