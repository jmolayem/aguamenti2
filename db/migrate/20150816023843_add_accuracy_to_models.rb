class AddAccuracyToModels < ActiveRecord::Migration
  def change
    add_column :models, :accuracy, :integer
  end
end
