class DatagalleryPolicy
	attr_reader :user, :datagallery
	def initialize(user, datagallery)
		@user = user
		@datagallery = datagallery
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
		user && (user.admin?)
	end

	def edit?
		user.admin?
	end
	
	def update?
		user.admin?
	end
end