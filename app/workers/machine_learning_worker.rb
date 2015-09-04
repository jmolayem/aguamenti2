class MachineLearningWorker
  include Sidekiq::Worker

  def perform(result_id, request_params)
    Rails.logger.info "Fetching response for result #{result_id}"
    
    result = Result.find result_id
    model = result.model

    result.update! body: MachineLearning.create_post(model.api_key, model.endpoint, request_params)

    Rails.logger.info "Successful operation"
  end
end
