class AddUserToConvnetimages < ActiveRecord::Migration
  def change
    add_reference :convnetimages, :user, index: true, foreign_key: true
  end
end
