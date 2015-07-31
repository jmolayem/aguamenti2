class AddApiKeyToModels < ActiveRecord::Migration
  def change
    add_column :models, :api_key, :string
  end
end
