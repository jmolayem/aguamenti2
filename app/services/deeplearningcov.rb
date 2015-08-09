# MachineLearning.create_post(api_key, endpoint, {Empl: '10181', Project: '103531', Hours: '0'})
class deeplearning

  def self.create_post(api, payload)
    new(api, payload).create_post
  end

  def initialize(api, payload)
    @headers = {
      Authorization: "Bearer #{api}",
      content_type: :multipart/form-data;,
      accept: :json
    }

    @payload = payload

  end

  def create_post
    RestClient.post @endpoint, payload.to_json, @headers
  end

  private

    def payload
      result = @default_body.dup
      end
      result
    end
end