class AddAttachmentSnippetToDatagalleries < ActiveRecord::Migration
  def self.up
    change_table :datagalleries do |t|
      t.attachment :snippet
    end
  end

  def self.down
    remove_attachment :datagalleries, :snippet
  end
end
