json.array!(@datagalleries) do |datagallery|
  json.extract! datagallery, :id, :name, :organization, :size
  json.url datagallery_url(datagallery, format: :json)
end
