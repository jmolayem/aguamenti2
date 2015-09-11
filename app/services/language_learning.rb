class LanguageLearning
  ENDPOINT = "https://www.metamind.io/language/classify"

  def self.post_language(classifier_id, value)
    new.post_language(classifier_id, value)
  end

  def initialize
    @headers = {
      'Authorization' => "Basic #{ENV['METAMIND_API_KEY']}"
    }
  end

  def post_language(classifier_id, value)
    payload = { classifier_id: classifier_id, value: value }
    RestClient.post(ENDPOINT, payload.to_json, @headers)
  end
end