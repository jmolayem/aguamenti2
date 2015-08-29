class AddUserToConvnetimageResults < ActiveRecord::Migration
  def change
    add_reference :convnetimage_results, :user, index: true, foreign_key: true
  end
end
