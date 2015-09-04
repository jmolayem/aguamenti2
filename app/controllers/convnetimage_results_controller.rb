class ConvnetimageResultsController < ApplicationController
	def create
		@convnetimage_result = ConvnetimageResult.new(convnetimage_result_params)
		@convnetimage_result.user = current_user
		if @convnetimage_result.save
        	DeepLearningWorker.perform_async(:post, @convnetimage_result.id)
			flash[:notice] = 'Wait while the result is being processed...' 
		else
			flash[:errors] = @convnetimage_result
		end
		redirect_to convnetimage_path(@convnetimage_result.convnetimage)
	end

	private

		def convnetimage_result_params
			params.require(:convnetimage_result).permit(:image, :convnetimage_id)
		end
end