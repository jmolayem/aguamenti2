class AddAttachmentSnippetToConvnetimages < ActiveRecord::Migration
  def self.up
    change_table :convnetimages do |t|
      t.attachment :snippet
    end
  end

  def self.down
    remove_attachment :convnetimages, :snippet
  end
end
