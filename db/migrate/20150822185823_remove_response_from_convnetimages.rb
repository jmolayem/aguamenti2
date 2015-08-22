class RemoveResponseFromConvnetimages < ActiveRecord::Migration
  def change
    remove_column :convnetimages, :response, :string
  end
end
