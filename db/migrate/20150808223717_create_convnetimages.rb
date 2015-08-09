class CreateConvnetimages < ActiveRecord::Migration
  def change
    create_table :convnetimages do |t|
      t.string :name
      t.string :api
      t.string :modelid
      t.text :description

      t.timestamps null: false
    end
  end
end
