class DeepLearningWorker
  include Sidekiq::Worker

  def perform(operation, convnetimage_id)
    logger.info "Finding Convnetimage: #{convnetimage_id}"
    convnetimage = Convnetimage.find(convnetimage_id)

    logger.info "Operation: #{operation}"
    case operation
    when /\Apost\Z/
      file = open convnetimage.zip_image.path
      response = DeepLearning.post_image(convnetimage.api, convnetimage.iterations, file)
      logger.info "Successfully posted image: #{response}"

      analyze_response(response, convnetimage)
    when /\Aget\Z/
      response = DeepLearning.get_stats(convnetimage.api, convnetimage.response_id)
      analyze_response(response, convnetimage)
    else
      fail
    end
  end

  def analyze_response(response, convnetimage)
    parsed_response = JSON.parse(response)
    logger.info "Got response: #{parsed_response.inspect}"
    convnetimage.update!(response: response)
    if parsed_response["state"] == "FINISHED"
      logger.info "Successfully got stats."
    else
      predicting_time = response["predicting_time"].to_f.seconds
      logger.info "Not finished yet. Scheduled get for #{predicting_time}"
      DeepLearningWorker.delay_for(predicting_time, retry: true)
      .perform_async(:get, convnetimage.id)
    end
  end
end

# d6f6aa8719125ae791686c3510168e06047a4704
# [23543]