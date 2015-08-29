class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:facebook]
   validates :name, presence: true
   validates :email, :presence => true,
                  :uniqueness => { :case_sensitive => false }
   has_many :models, dependent: :destroy
   has_many :results, dependent: :destroy
   has_many :convnetimages
   has_many :convnetimage_results, dependent: :destroy

   def self.from_omniauth(auth)
  #where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #user.email = auth.info.email
    user.email = "#{(0..8).map { (65 + rand(26)).chr }.join}@gmail.com"
    user.password = Devise.friendly_token[0, 20]
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end
end
