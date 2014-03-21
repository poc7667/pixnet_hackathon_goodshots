class Image < ActiveRecord::Base


  GEOG_FACTORY ||= RGeo::Geographic.spherical_factory(:srid => 4326)
  set_rgeo_factory_for_column(:lonlat, GEOG_FACTORY)

  # RGeo::ActiveRecord::GeometryMixin.set_json_generator(:geojson)

  scope :nearby, lambda { |radius_in_km, lng, lat|
    point = GEOG_FACTORY.point(lng, lat)
    where("ST_DWithin(lonlat, ST_GeomFromText('#{point}'), #{radius_in_km.to_f*1000} )")
  }
end
