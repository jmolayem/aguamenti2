class ConvnetimageResultsController < ApplicationController
	def create
		@convnetimage_result = ConvnetimageResult.new(convnetimage_result_params)
		@convnetimage_result.user = current_user
		@target_selector = params[:target_selector]

		if @convnetimage_result.save
        	DeepLearningWorker.perform_async(@convnetimage_result.id)
			flash[:notice] = 'Wait while the result is being processed...' 
		else
			flash[:errors] = @convnetimage_result
		end

		respond_to do |format|
			format.js { render }
			format.html do
				redirect_to convnetimage_path(@convnetimage_result.convnetimage)
			end
		end
	end

	def show
		@convnetimage_result = ConvnetimageResult.find(params[:id])
		render json: {
				completed: @convnetimage_result.completed?,
				body: render_to_string(layout: false),
				data: @convnetimage_result
			}
	end

	private

		def convnetimage_result_params
			params.require(:convnetimage_result).permit(:image, :convnetimage_id)
		end
end