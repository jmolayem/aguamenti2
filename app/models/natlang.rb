class Natlang < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  else
    has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png",
      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
  end
  validates :api_key,:classifier_id,:accuracy, :size,:organization, presence: true
end
