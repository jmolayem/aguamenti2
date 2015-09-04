# MachineLearning.create_post(api_key, endpoint, {Empl: '10181', Project: '103531', Hours: '0'})
class MachineLearning

  def self.create_post(api_key, endpoint, request_params)
    new(api_key, endpoint, request_params).create_post
  end

  def initialize(api_key, endpoint, request_params)
    @headers = {
      Authorization: "Bearer #{api_key}",
      content_type: :json,
      accept: :json
    }

    @request_params = request_params
    @endpoint = endpoint

    @default_body = {
                      Inputs: {
                        input1: {
                          ColumnNames: [],
                          Values: [[], []]
                        }
                      },
                    }
  end

  def create_post
    RestClient.post @endpoint, request_params.to_json, @headers
  end

  private

    def request_params
      result = @default_body.dup
      @request_params.each do |column, value|
        result[:Inputs][:input1][:ColumnNames] << column
        result[:Inputs][:input1][:Values][0] << value
        result[:Inputs][:input1][:Values][1] << ''
      end
      result
    end
end
