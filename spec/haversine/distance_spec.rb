require "spec_helper"
require "haversine/point"
require "haversine/distance"

RSpec.describe ::Haversine::Distance do
  describe ".between_points" do
    context "from A to A" do
      let(:lat_deg) { 51.4934 }
      let(:lon_deg) { 0.0098 }
      let(:point_a) { ::Haversine::Point.from_degrees(lat_deg, lon_deg) }
      let(:point_b) { point_a }

      specify do
        expect(described_class.between_points(point_a, point_b)).to eq(0.0)
      end
    end

    context "from A to B" do
      # Royal Observatory Greenwich
      let(:point_a) { ::Haversine::Point.from_degrees(51.4934, 0.0098) }
      # Dublin city centre
      let(:point_b) { ::Haversine::Point.from_degrees(53.350140, -6.266155) }

      specify do
        expect(described_class.between_points(point_a, point_b)).to eq(473_323.04312719754) # ~ 473 km
        expect(described_class.between_points(point_b, point_a)).to eq(473_323.04312719754) # ~ 473 km
      end
    end
  end
end
