class AddAttachmentCoverToConvnetimages < ActiveRecord::Migration
  def self.up
    change_table :convnetimages do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :convnetimages, :cover
  end
end
