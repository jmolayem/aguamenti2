class Convnetimage < ActiveRecord::Base

  belongs_to :user
  has_many :convnetimage_results

  has_attached_file :cover, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  has_attached_file :dataset
  validates :cover,:dataset,:name, :description, :size, :accuracy, :api, :iterations, presence: true
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :dataset, :content_type => /\Aapplication\/zip\Z/
  validates_attachment_size :dataset, :less_than => 100.megabytes
end
