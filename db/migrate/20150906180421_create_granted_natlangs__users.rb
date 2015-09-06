class CreateGrantedNatlangsUsers < ActiveRecord::Migration
  def change
    create_table :granted_natlangs__users do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :natlang, index: true, foreign_key: true
    end
  end
end
