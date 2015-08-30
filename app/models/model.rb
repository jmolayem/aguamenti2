class Model < ActiveRecord::Base
  include AlgoliaSearch

  after_save :index!
  before_destroy :remove_from_index!

  algoliasearch do

  end
  include ManaPotion::Pool
  belongs_to :user

  mana_pool_for :user, limit:10, period: 1.hour

  end
  user = User.create!
  user.models.create! # No problem here
  user.models.create! # Raises an ActiveRecord::RecordInvalid exception

  require 'timecop'
  Timecop.travel 1.day.from_now
  user.models.create! # No problem here
  
  has_many :inputs
  has_many :outputs
  has_many :results
  belongs_to :user
  accepts_nested_attributes_for :inputs, :outputs, reject_if: :all_blank, allow_destroy: true

  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  has_attached_file :dataset

  validates :name, :description, :accuracy, :algorithm, :organization, :api_key, :size, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :dataset, :content_type => ['application/csv','application/xlsx','application/xls'], :message => ',Only excel and csv files are allowed.'
  validates_attachment_size :dataset, :less_than => 25.megabytes
end
