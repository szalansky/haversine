module Haversine
  class Point < Struct.new(:lat, :lon)
    def self.from_degrees(lat_deg, lon_deg)
      radian = Math::PI/180
      new(lat_deg * radian, lon_deg * radian)
    end
  end
end
