# MachineLearning.create_post({Empl: '10181', Project: '103531', Hours: '0'})
class MachineLearning
  API_URI = "https://ussouthcentral.services.azureml.net/workspaces/a0b8378fac2542d7a5d7297f1c1f139d/services/ca5efa957cbb465d90b26e90f7797bae/execute?api-version=2.0&details=true"

  def self.create_post(model_params)
    new(model_params).create_post
  end

  def initialize(model_params)
    # Assert keys
    model_params.fetch('Empl')
    model_params.fetch('Project')
    model_params.fetch('Hours')

    @headers = {
      Authorization: "Bearer #{ENV["AZURE_API_KEY"]}",
      content_type: :json,
      accept: :json
    }

    @model_params = model_params

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
    RestClient.post API_URI, model_params.to_json, @headers
  end

  private

    def model_params
      result = @default_body.dup
      @model_params.each do |column, value|
        result[:Inputs][:input1][:ColumnNames] << column
        result[:Inputs][:input1][:Values][0] << value
        result[:Inputs][:input1][:Values][1] << ''
      end
      result
    end
end
