class CreateGrantedModelsUsers < ActiveRecord::Migration
  def change
    create_table :granted_models_users do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :model, index: true, foreign_key: true
    end
  end
end
