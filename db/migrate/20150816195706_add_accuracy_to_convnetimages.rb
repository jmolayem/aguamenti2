class AddAccuracyToConvnetimages < ActiveRecord::Migration
  def change
    add_column :convnetimages, :accuracy, :integer
  end
end
