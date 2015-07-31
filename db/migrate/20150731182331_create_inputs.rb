class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.string :name
      t.string :kind
      t.belongs_to :model, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
