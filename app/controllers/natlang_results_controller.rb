class NatlangResultsController < ApplicationController
	def create
		@natlang_result = NatlangResult.new(natlang_result_params)
		@natlang_result.user = current_user
		if @natlang_result.save
        	LanguageLearningWorker.perform_async(@natlang_result.id)
			flash[:notice] = 'Wait while the result is being processed...' 
		else
			flash[:errors] = @natlang_result.errors
		end
		redirect_to natlang_path(@natlang_result.natlang)
	end

	private

		def natlang_result_params
			params.require(:natlang_result).permit(:value, :natlang_id)
		end
end