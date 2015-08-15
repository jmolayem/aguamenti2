class AddResponseToConvnetimages < ActiveRecord::Migration
  def change
    add_column :convnetimages, :response, :string
  end
end
