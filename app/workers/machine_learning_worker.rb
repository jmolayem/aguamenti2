class MachineLearningWorker
  include Sidekiq::Worker

  def perform(model_params, user_id)
    params = model_params.merge("Hours" => '0')
    puts params
    Rails.logger.info params
    Result.create!(body: MachineLearning.create_post(params), user: User.find(user_id))
    Rails.logger.info "Successful operation"
  end
end
