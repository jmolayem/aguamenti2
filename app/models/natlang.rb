class Natlang < ActiveRecord::Base
  include PublicActivity::Common

  has_many :natlang_results

  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  has_attached_file :dataset
  has_attached_file :snippet

  validates :classifier_id, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  #validates_attachment_content_type :dataset, content_type: 'text/plain', :message => 'Only .txt files are allowed.'
  #validates_attachment_size :dataset, :less_than => 25.megabytes
end
