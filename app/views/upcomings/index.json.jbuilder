json.array!(@upcomings) do |upcoming|
  json.extract! upcoming, :id, :name, :newdate, :state, :city, :modeltyp, :organization
  json.url upcoming_url(upcoming, format: :json)
end
