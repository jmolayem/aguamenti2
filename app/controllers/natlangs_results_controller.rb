class NatlangResultsController < ApplicationController
	def create
		@natlang_result = Natlang.new(natlang_result_params)
		@natlang_result.user = current_user
		if @natlang_result.save
        	LanguageLearning.perform_async(:post, @natlang_result.id)
			flash[:notice] = 'Wait while the result is being processed...' 
		else
			flash[:errors] = @natlang_result
		end
		redirect_to natlang_path(@natlang_result.natlang)
	end

	private

		def natlang_result_params
			params.require(:natlang_result).permit(:image, :natlang_id)
		end
end