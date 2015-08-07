class AddEndpointToModels < ActiveRecord::Migration
  def change
    add_column :models, :endpoint, :string
  end
end
