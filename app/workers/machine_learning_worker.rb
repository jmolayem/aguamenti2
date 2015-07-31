class MachineLearningWorker
  include Sidekiq::Worker

  def perform(result_params, model_id, user_id)
    Rails.logger.info result_params
    user = User.find(user_id)
    model = Model.find(model_id)
    Result.create!(body: MachineLearning.create_post(model.api_key, result_params), user: user, model: model)
    Rails.logger.info "Successful operation"
  end
end
