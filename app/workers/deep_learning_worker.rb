class DeepLearningWorker
  include Sidekiq::Worker

  def perform(convnetimage_result_id)
    logger.info "Finding convnetimage_result: #{convnetimage_result_id}"
    convnetimage_result = ConvnetimageResult.find(convnetimage_result_id)
    convnetimage = convnetimage_result.convnetimage

    response = DeepLearning.post_image(convnetimage.classifier_id, convnetimage_result.image.url)
    convnetimage_result.update!(response: response)

    # TODO: Only retry for expected errors, like limit exceeded
    unless convnetimage_result.completed?
      DeepLearningWorker.delay_for(5.seconds, retry: true)
      .perform_async(convnetimage_result_id)
    end
  end
end