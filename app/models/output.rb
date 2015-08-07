class Output < ActiveRecord::Base
  belongs_to :model
  validates :name, :kind, :default_value, presence: true
  
  default_scope -> { order(:order) }
end
