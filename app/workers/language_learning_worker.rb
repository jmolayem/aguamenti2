class LanguageLearningWorker
  include Sidekiq::Worker

  def perform(natlang_result_id)
  	natlang_result = NatlangResult.find(natlang_result_id)

  	response = LanguageLearning.post_language(natlang_result.natlang.classifier_id, natlang_result.value)
  	natlang_result.update!(response: response)

  	# TODO: Only retry for expected errors, like limit exceeded
  	unless natlang_result.completed?
  		LanguageLearningWorker.delay_for(5.seconds, retry: true)
  		.perform_async(natlang_result_id)
  	end
  end
end