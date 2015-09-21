class ModelPolicy
	attr_reader :user, :model
	def initialize(user, model)
		@user = user
		@model = model
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
		user && (user.admin? || user.granted_models.find_by(id: model))
	end

	def edit?
		user.admin?
	end
end