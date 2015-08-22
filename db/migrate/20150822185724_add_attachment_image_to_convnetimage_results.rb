class AddAttachmentImageToConvnetimageResults < ActiveRecord::Migration
  def self.up
    change_table :convnetimage_results do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :convnetimage_results, :image
  end
end
