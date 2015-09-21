class ConvnetimagePolicy
	attr_reader :user, :convnetimage
	def initialize(user, convnetimage)
		@user = user
		@convnetimage = convnetimage
	end

	def index?
		user?
	end

	def new?
		user.admin?
	end

	def create?
		user.admin?
	end

	def destroy?
		user.admin?
	end

	def show?
		user && (user.admin? || user.granted_convnetimages.find_by(id: convnetimage))
	end

	def edit?
		user.admin?
	end
	
	def update?
		user.admin?
	end
end