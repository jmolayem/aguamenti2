class LanguageLearning
  ENDPOINT = "https://www.metamind.io/language/classify"

  def self.post_language(api_key, file)
    new(api_key).post_language(file)
  end

  def initialize(api_key)
    @endpoint = ENDPOINT
    @api_key = api_key
  end

  def post_text
    RestClient.post(@endpoint, @payload, @headers).slice(:id)
  end
end