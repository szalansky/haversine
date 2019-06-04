module Haversine
  class Circle < Struct.new(:centre, :radius)
    def contains?(point)
      Distance.between_points(centre, point) <= radius
    end
  end
end
