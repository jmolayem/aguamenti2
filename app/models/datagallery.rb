class Datagallery < ActiveRecord::Base
	include PublicActivity::Common

	belongs_to :user

	has_attached_file :dataset
  	has_attached_file :snippet
  validates :name, presence: true
  validates_attachment_content_type :dataset, :content_type => ['text/csv','application/xlsx','application/xls'], :message => ',Only excel and csv files are allowed.'
  validates_attachment_size :dataset, :less_than => 25.megabytes
  validates_attachment_content_type :snippet, :content_type => ['text/csv','application/xlsx','application/xls'], :message => ',Only excel and csv files are allowed.'
  validates_attachment_size :snippet, :less_than => 1.megabytes
end
