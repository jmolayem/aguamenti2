class RemoveApiFromConvnetimages < ActiveRecord::Migration
  def change
    remove_column :convnetimages, :api, :string
  end
end
