class AddOrganizationToNatlangs < ActiveRecord::Migration
  def change
    add_column :natlangs, :organization, :string
  end
end
