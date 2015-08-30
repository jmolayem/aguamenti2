class Convnetimage < ActiveRecord::Base

  include ManaPotion::Pool

  mana_pool_for :user, limit:10, period: 1.hour

  end
  user = User.create!
  user.models.create! # No problem here
  user.models.create! # Raises an ActiveRecord::RecordInvalid exception

  require 'timecop'
  Timecop.travel 1.day.from_now
  user.models.create! # No problem here

  belongs_to :user
  has_many :convnetimage_results

  has_attached_file :cover, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  has_attached_file :dataset
  validates :cover,:dataset,:name, :description, :size, :accuracy, :api, :iterations, presence: true
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :dataset, :content_type => /\Aapplication\/zip\Z/
  validates_attachment_size :dataset, :less_than => 100.megabytes
end
