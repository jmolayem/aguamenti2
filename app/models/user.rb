class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
email_regex = /\A[\w+\-.]+@usc\.edu\z/i
   validates :name, presence: true
   validates :email, :presence => true,
                  :format   => { :with => email_regex },
                  :uniqueness => { :case_sensitive => false }
end
