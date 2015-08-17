class AddApiKeyToNatlangs < ActiveRecord::Migration
  def change
    add_column :natlangs, :api_key, :string
  end
end
