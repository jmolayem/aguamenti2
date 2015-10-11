class AddSauceToUpcoming < ActiveRecord::Migration
  def change
    add_column :upcomings, :sauce, :string
  end
end
