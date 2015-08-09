# MachineLearning.create_post(api_key, endpoint, {Empl: '10181', Project: '103531', Hours: '0'})
class deeplearning

  def self.create_post(api, payload)
    new(api, payload).create_post
  end

  def initialize(api, payload)
    @endpoint = "http://api.ersatzlabs.com/api/predict/image"
    @headers = {
      #Authorization: "Bearer #{api}",
      accept: :json
    }
  
    @payload = {
      'key' => 'asdasdasd',
      'file-0' => File.new('/path/to/file'),
      'file-1' => File.new('...')
    }
  end

  def create_post
    RestClient.post @endpoint, @payload, @headers
  end

  private

    def payload
      result = @default_body.dup
      end
      result
    end
end