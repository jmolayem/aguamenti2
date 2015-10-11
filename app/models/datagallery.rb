class Datagallery < ActiveRecord::Base
	include AlgoliaSearch
  include PublicActivity::Common

  after_save :index!
  before_destroy :remove_from_index!

  algoliasearch do

  end
	belongs_to :user
	belongs_to :category

	has_attached_file :dataset
  	has_attached_file :snippet
  	validates :name, presence: true
  	validates_attachment_content_type :dataset, :content_type => /.*/, :message => ',Only excel and csv files are allowed.'
  #validates_attachment_size :dataset, :less_than => 25.megabytes
  	validates_attachment_content_type :snippet, :content_type => /.*/, :message => ',Only excel and csv files are allowed.'
  #validates_attachment_size :snippet, :less_than => 1.megabytes
end
