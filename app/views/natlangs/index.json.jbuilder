json.array!(@natlangs) do |natlang|
  json.extract! natlang, :id, :name, :description
  json.url natlang_url(natlang, format: :json)
end
