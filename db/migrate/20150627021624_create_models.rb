class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :city
      t.string :organization

      t.timestamps null: false
    end
  end
end
