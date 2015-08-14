class Convnetimage < ActiveRecord::Base

  has_many :results
  belongs_to :user

  if Rails.env.development?
    has_attached_file :zip_image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  else
    has_attached_file :zip_image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png",
      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
  end
  validates :name, :description, :api_key, :modelid, :zip_image, presence: true
  validates_attachment_content_type :zip_image, :content_type => /\Aapplication\/zip\Z/
end
