class CreateConvnetimageResults < ActiveRecord::Migration
  def change
    create_table :convnetimage_results do |t|
      t.string :response
      t.belongs_to :convnetimage, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
