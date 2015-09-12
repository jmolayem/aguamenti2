class AddAttachmentSnippetToNatlangs < ActiveRecord::Migration
  def self.up
    change_table :natlangs do |t|
      t.attachment :snippet
    end
  end

  def self.down
    remove_attachment :natlangs, :snippet
  end
end
