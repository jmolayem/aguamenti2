class deeplearningWorker
  include Sidekiq::Worker

  def perform(model_id, user_id)
    Rails.logger.info result_params
    user = User.find(user_id)
    covnetimage = covnetimage.find(model_id)
    Result.create!(
    	body: deeplearning.create_post(covnetimage.api),
    	user: user, covnetimage: covnetimage
   	)
    Rails.logger.info "Successful operation"
  end
end
