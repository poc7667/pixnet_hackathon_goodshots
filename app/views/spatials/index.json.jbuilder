json.array!(@spatials) do |spatial|
  json.extract! spatial, :id, :shap1, :shp2, :path, :lonlat, :lon, :lat
  json.url spatial_url(spatial, format: :json)
end
