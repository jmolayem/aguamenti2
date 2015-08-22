class Convnetimage < ActiveRecord::Base

  belongs_to :user
  has_many :convnetimage_results

  if Rails.env.development?
    has_attached_file :cover, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  else
    has_attached_file :cover, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png",
      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
  end
  validates :cover,:name, :description, :size, :accuracy, :api, :iterations, presence: true
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
