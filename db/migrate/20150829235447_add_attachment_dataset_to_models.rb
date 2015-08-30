class AddAttachmentDatasetToModels < ActiveRecord::Migration
  def self.up
    change_table :models do |t|
      t.attachment :dataset
    end
  end

  def self.down
    remove_attachment :models, :dataset
  end
end
