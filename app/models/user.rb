class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauth_providers => [:facebook]
   validates :name, presence: true
   validates :email, :presence => true,
                  :uniqueness => { :case_sensitive => false }
   has_many :models, dependent: :destroy
   has_many :results, dependent: :destroy
   has_many :convnetimages
   has_many :convnetimage_results, dependent: :destroy
   has_many :natlang_results, dependent: :destroy
   has_and_belongs_to_many :granted_models, class_name: 'Model', join_table: 'granted_models_users'
   has_and_belongs_to_many :granted_convnetimages, class_name: 'Convnetimage', join_table: 'granted_convnetimages_users'
   has_and_belongs_to_many :granted_natlangs, class_name: 'Natlang', join_table: 'granted_natlangs_users'

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
