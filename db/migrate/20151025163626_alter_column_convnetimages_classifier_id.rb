class AlterColumnConvnetimagesClassifierId < ActiveRecord::Migration
  def self.up
    change_table :convnetimages do |t|
      t.change :classifier_id, :string
    end
  end
  def self.down
    change_table :convnetimages do |t|
      t.change :classifier_id, :integer
    end
  end
end
