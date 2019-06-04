module Haversine
  class Distance
    # SI Base unit value (in meters)
    RADIUS = 6.3781 * 10**6
    def self.between_points(point_a, point_b)
      d_lat = (point_b.lat - point_a.lat).abs
      d_lon = (point_b.lon - point_a.lon).abs

      val = Math.sin(d_lat/2)**2 +
            Math.cos(point_a.lat) * Math.cos(point_b.lat) * Math.sin(d_lon/2)**2
      2 * RADIUS * Math.asin(Math.sqrt(val))
    end
  end
end
