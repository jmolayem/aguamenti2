class AddOrderToOutputs < ActiveRecord::Migration
  def change
    add_column :outputs, :order, :integer
  end
end
