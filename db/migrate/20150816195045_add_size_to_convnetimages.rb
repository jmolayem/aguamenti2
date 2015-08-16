class AddSizeToConvnetimages < ActiveRecord::Migration
  def change
    add_column :convnetimages, :size, :integer
  end
end
