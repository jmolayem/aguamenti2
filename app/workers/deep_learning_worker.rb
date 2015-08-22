class DeepLearningWorker
  include Sidekiq::Worker

  def perform(operation, convnetimage_result_id)
    logger.info "Finding convnetimage_result: #{convnetimage_result_id}"
    convnetimage_result = ConvnetimageResult.find(convnetimage_result_id)
    convnetimage = convnetimage_result.convnetimage

    logger.info "Operation: #{operation}"
    case operation
    when /\Apost\Z/
      file = open convnetimage_result.image.path
      response = DeepLearning.post_image(convnetimage.api, convnetimage.iterations, file)
      logger.info "Successfully posted image: #{response}"

      analyze_response(response, convnetimage_result)
    when /\Aget\Z/
      response = DeepLearning.get_stats(convnetimage.api, convnetimage_result.response_id)
      analyze_response(response, convnetimage_result)
    else
      fail "Operation not permitted: #{operation}"
    end
  end

  def analyze_response(response, convnetimage_result)
    parsed_response = JSON.parse(response)
    logger.info "Got response: #{parsed_response.inspect}"
    convnetimage_result.update!(response: response)
    if parsed_response["state"] == "FINISHED"
      logger.info "Successfully got stats."
    else
      logger.info "Not finished yet. Scheduled get for 5 seconds."
      DeepLearningWorker.delay_for(5.seconds, retry: true)
      .perform_async(:get, convnetimage_result.id)
    end
  end
end

# d6f6aa8719125ae791686c3510168e06047a4704
# [23543]