class AddClassifierIdToConvnetimages < ActiveRecord::Migration
  def change
    add_column :convnetimages, :classifier_id, :integer
  end
end
