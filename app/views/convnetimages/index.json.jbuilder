json.array!(@convnetimages) do |convnetimage|
  json.extract! convnetimage, :id, :name, :api, :modelid, :description
  json.url convnetimage_url(convnetimage, format: :json)
end
