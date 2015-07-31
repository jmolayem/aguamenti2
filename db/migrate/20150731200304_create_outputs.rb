class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.belongs_to :model, index: true, foreign_key: true
      t.string :name
      t.string :kind
      t.string :default_value

      t.timestamps null: false
    end
  end
end
