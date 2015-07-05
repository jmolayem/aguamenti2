class Model < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
	else
	has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png",
						:storage => :dropbox,
						:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
						:path => ":style/:id_:filename"
end
validates :name, :description, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
