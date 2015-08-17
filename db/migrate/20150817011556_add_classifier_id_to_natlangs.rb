class AddClassifierIdToNatlangs < ActiveRecord::Migration
  def change
    add_column :natlangs, :classifier_id, :string
  end
end
