class RemoveModelidFromConvnetimages < ActiveRecord::Migration
  def change
    remove_column :convnetimages, :modelid, :string
  end
end
