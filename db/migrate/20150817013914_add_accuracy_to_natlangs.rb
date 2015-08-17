class AddAccuracyToNatlangs < ActiveRecord::Migration
  def change
    add_column :natlangs, :accuracy, :integer
  end
end
