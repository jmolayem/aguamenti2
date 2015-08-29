class AddAttachmentDatasetToConvnetimages < ActiveRecord::Migration
  def self.up
    change_table :convnetimages do |t|
      t.attachment :dataset
    end
  end

  def self.down
    remove_attachment :convnetimages, :dataset
  end
end
