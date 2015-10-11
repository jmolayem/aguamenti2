class CreateUpcomings < ActiveRecord::Migration
  def change
    create_table :upcomings do |t|
      t.string :name
      t.string :newdate
      t.string :state
      t.string :city
      t.string :modeltyp
      t.string :organization

      t.timestamps null: false
    end
  end
end
