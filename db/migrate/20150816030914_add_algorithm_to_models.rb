class AddAlgorithmToModels < ActiveRecord::Migration
  def change
    add_column :models, :algorithm, :string
  end
end
