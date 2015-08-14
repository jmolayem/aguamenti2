# MachineLearning.create_post(api_key, endpoint, {Empl: '10181', Project: '103531', Hours: '0'})
class DeepLearning

  def self.create_post(api, payload)
    new(api, payload).create_post
  end

  def initialize(api, payload)
    @endpoint = "http://api.ersatzlabs.com/api/predict/"
    @headers = {
      #Authorization: "Bearer #{api}",
      accept: :json
    }
  
    @payload = {
      'key' => 'd6f6aa8719125ae791686c3510168e06047a4704',
      'file-0' => File.new('test.png')
    }
  end

  def create_post
  	binding.pry
    RestClient.post @endpoint, @payload, @headers
  end
end