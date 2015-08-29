class Natlang < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"

  validates :api_key,:classifier_id,:accuracy, :size,:organization, presence: true
end
