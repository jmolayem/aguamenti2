class AddOrderToInputs < ActiveRecord::Migration
  def change
    add_column :inputs, :order, :integer
  end
end
