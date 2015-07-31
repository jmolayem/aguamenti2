class AddModelToResults < ActiveRecord::Migration
  def change
    add_reference :results, :model, index: true, foreign_key: true
  end
end
