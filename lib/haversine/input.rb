module Haversine
  class Input
    def initialize(**data)
      @lat = Float(data.fetch(:latitude))
      @lon = Float(data.fetch(:longitude))
      @user_id = Integer(data.fetch(:user_id))
      @name = data.fetch(:name)

      @raw_data = data
    end

    attr_reader :lat, :lon, :user_id, :name, :raw_data

    def to_point
      Point.from_degrees(lat, lon)
    end
  end
end
