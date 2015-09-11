class CreateNatlangResults < ActiveRecord::Migration
  def change
    create_table :natlang_results do |t|
      t.belongs_to :natlang, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :value
      t.string :response

      t.timestamps null: false
    end
  end
end