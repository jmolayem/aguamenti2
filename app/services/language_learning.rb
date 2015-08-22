class LanguageLearning
  ENDPOINT = "https://www.metamind.io/language/classify"

  def self.post_language(api_key, file)
    new(api_key).post_language(file)
  end

  def initialize(api_key)
    @endpoint = ENDPOINT
    @api_key = api_key
  end

  private

  def headers_for_post
    {
      accept: :json
    }
  end

  def build_payload(iterations, file)
    {
      'key' => @api_key,
      'file-0' => file
    }
  end
end