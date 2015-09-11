class RemoveApiKeyFromNatlangs < ActiveRecord::Migration
  def change
    remove_column :natlangs, :api_key, :string
  end
end
