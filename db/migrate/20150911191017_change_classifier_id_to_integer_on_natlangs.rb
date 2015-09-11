class ChangeClassifierIdToIntegerOnNatlangs < ActiveRecord::Migration
  def up
  	change_column :natlangs, :classifier_id, :integer
  end

  def down
  	change_column :natlangs, :classifier_id, :string
  end
end
