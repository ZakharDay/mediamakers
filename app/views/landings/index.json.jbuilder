json.array!(@landings) do |landing|
  json.extract! landing, :id, :index
  json.url landing_url(landing, format: :json)
end
