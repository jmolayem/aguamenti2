class NatlangPolicy
	attr_reader :user, :natlang
	def initialize(user, natlang)
		@user = user
		@natlang = natlang
	end

	def new?
		user && user.admin?
	end

	def create?
		user.admin?
	end

	def show?
		user && (user.admin? || user.granted_models.find_by(id: model))
	end
end