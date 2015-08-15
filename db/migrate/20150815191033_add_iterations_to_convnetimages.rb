class AddIterationsToConvnetimages < ActiveRecord::Migration
  def change
    add_column :convnetimages, :iterations, :string
  end
end
