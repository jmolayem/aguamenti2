class Convnetimage < ActiveRecord::Base
  include PublicActivity::Common
  #include ManaPotion::Pool

  #mana_pool_for :user, limit:10, period: 10.hour
  acts_as_punchable

  belongs_to :user
  has_and_belongs_to_many :granted_users, class_name: 'User', join_table: 'granted_convnetimages_users'
  has_many :convnetimage_results

  has_attached_file :cover, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  has_attached_file :dataset
  has_attached_file :snippet
  #validates :cover,:dataset,:name, :description, :size, :accuracy, :api, :iterations, presence: true
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :dataset, :content_type => /.*/, :message => ',Only excel and csv files are allowed.'
  validates_attachment_content_type :snippet, :content_type => /.*/, :message => ',Only excel and csv files are allowed.'
  #validates_attachment_size :dataset, :less_than => 100.megabytes

  validates :classifier_id, presence: true
end
#GETTING ERROR WITH MANAPOOL GEM
#user = User.create!
#user.posts.create! # No problem here
#user.posts.create! # Raises an ActiveRecord::RecordInvalid exception

#require 'timecop'
#Timecop.travel 1.day.from_now
#user.posts.create! # No problem here