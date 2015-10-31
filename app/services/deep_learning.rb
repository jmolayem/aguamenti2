class DeepLearning
  ENDPOINT = "https://www.metamind.io/vision/classify"

  def self.post_image(classifier_id, image_url)
    new.post_image(classifier_id, image_url)
  end

  def initialize
    @headers = {
      'Authorization' => "Basic #{ENV['METAMIND_API_KEY']}"
    }
  end

  def post_image(classifier_id, image_url)
    classifier_id = classifier_id.to_i if classifier_id  =~ /^\d+$/
    payload = { classifier_id: classifier_id, image_url: image_url }
    RestClient.post(ENDPOINT, payload.to_json, @headers)
  end
end
