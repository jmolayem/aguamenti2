class AddAttachmentImageToNatlangs < ActiveRecord::Migration
  def self.up
    change_table :natlangs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :natlangs, :image
  end
end
