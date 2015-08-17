class AddSizeToNatlangs < ActiveRecord::Migration
  def change
    add_column :natlangs, :size, :integer
  end
end
