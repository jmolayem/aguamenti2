class AddAttachmentDatasetToNatlangs < ActiveRecord::Migration
  def self.up
    change_table :natlangs do |t|
      t.attachment :dataset
    end
  end

  def self.down
    remove_attachment :natlangs, :dataset
  end
end
