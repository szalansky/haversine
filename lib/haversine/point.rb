module Haversine
  class Point < Struct.new(:lat, :lon)
    RADIAN = Math::PI/180

    def self.from_degrees(lat_deg, lon_deg)
      new(lat_deg * RADIAN, lon_deg * RADIAN)
    end
  end
end
