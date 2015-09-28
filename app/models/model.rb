class Model < ActiveRecord::Base
  include AlgoliaSearch
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }

  after_save :index!
  before_destroy :remove_from_index!

  algoliasearch do

  end
  
  has_many :inputs
  has_many :outputs
  has_many :results
  belongs_to :user
  has_and_belongs_to_many :granted_users, class_name: 'User', join_table: 'granted_models_users'
  accepts_nested_attributes_for :inputs, :outputs, reject_if: :all_blank, allow_destroy: true

  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  has_attached_file :dataset
  has_attached_file :snippet

  validates :name, presence: true
  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  #validates_attachment_content_type :dataset, :content_type => ['text/csv','application/xlsx','application/xls'], :message => 'Only excel and csv files are allowed.'
  #validates_attachment_size :dataset, :less_than => 25.megabytes
end
#GETTING ERROR W/ Manapool Gem
#user = User.create!
##user.posts.create! # Raises an ActiveRecord::RecordInvalid exception

#require 'timecop'
#Timecop.travel 1.day.from_now
#user.posts.create! # No problem here