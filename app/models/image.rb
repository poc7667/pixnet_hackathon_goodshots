class Image < ActiveRecord::Base
  scope :nearby, lambda { |radius_in_km, lng, lat|
    point = GEOG_FACTORY.point(lng, lat)
    where("ST_DWithin(lnglat, ST_GeomFromText('#{point}'), #{radius_in_km.to_f*1000} )")
  }
end
