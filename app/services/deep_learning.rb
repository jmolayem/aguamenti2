class DeepLearning
  ENDPOINT = "http://api.ersatzlabs.com/api/predict/"

  def self.post_image(api_key, iterations, file)
    new(api_key).post_image(iterations, file)
  end

  def self.get_stats(api_key, model_id)
    new(api_key).get_stats(model_id)
  end

  def initialize(api_key)
    @endpoint = ENDPOINT
    @api_key = api_key
  end

  def post_image(iterations, file)
    RestClient.post(@endpoint, build_payload(iterations, file), headers_for_post)
  end

  def get_stats(modelid)
    RestClient.get("#{@endpoint}#{modelid}/?key=#{@api_key}")
  end

  private

  def headers_for_post
    {
      accept: :json
    }
  end

  def build_payload(iterations, file)
    {
      'iterations' => iterations,
      'key' => @api_key,
      'file-0' => file
    }
  end
end
