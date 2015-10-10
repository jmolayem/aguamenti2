class AddCategoryIdToDatagalleries < ActiveRecord::Migration
  def change
    add_column :datagalleries, :category_id, :integer
  end
end
