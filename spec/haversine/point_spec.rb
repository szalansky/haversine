require "spec_helper"
require "haversine/point"

RSpec.describe ::Haversine::Point do
  describe ".from_degrees" do
    subject { described_class.from_degrees(lat_deg, lon_deg) }
    context "null island coordinates" do
      let(:lat_deg) { 0.0 }
      let(:lon_deg) { 0.0 }

      specify do
        expect(subject.lat).to eq(0.0)
        expect(subject.lon).to eq(0.0)
      end
    end

    context "greenwich observatory coordinates" do
      let(:lat_deg) { 51.4934 }
      let(:lon_deg) { 0.0098 }

      specify do
        expect(subject.lat).to eq(0.8987293730464481)
        expect(subject.lon).to eq(0.00017104226669544429)
      end
    end
  end
end
