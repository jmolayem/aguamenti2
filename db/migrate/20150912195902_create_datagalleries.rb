class CreateDatagalleries < ActiveRecord::Migration
  def change
    create_table :datagalleries do |t|
      t.string :name
      t.string :organization
      t.integer :size

      t.timestamps null: false
    end
  end
end
