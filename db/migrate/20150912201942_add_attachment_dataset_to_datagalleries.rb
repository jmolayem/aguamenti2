class AddAttachmentDatasetToDatagalleries < ActiveRecord::Migration
  def self.up
    change_table :datagalleries do |t|
      t.attachment :dataset
    end
  end

  def self.down
    remove_attachment :datagalleries, :dataset
  end
end
