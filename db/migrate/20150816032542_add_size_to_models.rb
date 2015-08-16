class AddSizeToModels < ActiveRecord::Migration
  def change
    add_column :models, :size, :integer
  end
end
