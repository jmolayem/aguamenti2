json.array!(@models) do |model|
  json.extract! model, :id, :name, :description, :category, :city, :organization
  json.url model_url(model, format: :json)
end
