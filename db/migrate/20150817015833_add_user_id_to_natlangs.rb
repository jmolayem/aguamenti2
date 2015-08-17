class AddUserIdToNatlangs < ActiveRecord::Migration
  def change
    add_column :natlangs, :user_id, :integer
  end
end
