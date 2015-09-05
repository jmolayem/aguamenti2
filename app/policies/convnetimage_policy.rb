class ConvnetimagePolicy
	attr_reader :user, :convnetimage
	def initialize(user, convnetimage)
		@user = user
		@convnetimage = convnetimage
	end

	def new?
		user && user.admin?
	end

	def create?
		user.admin?
	end

	def show?
		user && (user.admin? || user.granted_convnetimages.find_by(id: convnetimage))
	end
end