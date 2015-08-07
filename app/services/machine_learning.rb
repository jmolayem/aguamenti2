# MachineLearning.create_post(api_key, endpoint, {Empl: '10181', Project: '103531', Hours: '0'})
class MachineLearning

  def self.create_post(api_key, endpoint, result_params)
    new(api_key, endpoint, result_params).create_post
  end

  def initialize(api_key, endpoint, result_params)
    @headers = {
      Authorization: "Bearer #{api_key}",
      content_type: :json,
      accept: :json
    }

    @result_params = result_params
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
    RestClient.post @endpoint, result_params.to_json, @headers
  end

  private

    def result_params
      result = @default_body.dup
      @result_params.each do |column, value|
        result[:Inputs][:input1][:ColumnNames] << column
        result[:Inputs][:input1][:Values][0] << value
        result[:Inputs][:input1][:Values][1] << ''
      end
      result
    end
end
