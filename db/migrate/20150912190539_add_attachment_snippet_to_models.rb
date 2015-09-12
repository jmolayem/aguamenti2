class AddAttachmentSnippetToModels < ActiveRecord::Migration
  def self.up
    change_table :models do |t|
      t.attachment :snippet
    end
  end

  def self.down
    remove_attachment :models, :snippet
  end
end
