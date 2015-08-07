class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :name, presence: true
   validates :email, :presence => true,
                  :uniqueness => { :case_sensitive => false }
   has_many :models, dependent: :destroy
   has_many :results, dependent: :destroy
end
