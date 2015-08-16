class Convnetimage < ActiveRecord::Base

  belongs_to :user

  if Rails.env.development?
    has_attached_file :zip_image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  else
    has_attached_file :zip_image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png",
      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
  end
  validates :cover,:name, :description,:size,:accuracy, :api, :iterations, :zip_image, presence: true
  validates_attachment_content_type :zip_image, :content_type => /\A(application\/zip|image\/.*)\Z/

  def state
    response["state"]
  end

  def response_id
    response["id"]
  end

  def labels
    response["results"]["predictions"][0]["output"][0]["labels"]
  end

  def response
    JSON.parse super
  end
end
