require "spec_helper"

RSpec.describe ::Haversine::Circle do
  describe "#contains?" do
    let(:greenwich) { ::Haversine::Point.from_degrees(51.4934, 0.0098) }

    let(:dublin) { ::Haversine::Point.from_degrees(53.350140, -6.266155) }
    let(:bray) { ::Haversine::Point.from_degrees(53.2009, -6.1111) }
    let(:lucan) { ::Haversine::Point.from_degrees(53.3572, -6.4498) }

    subject { described_class.new(greenwich, 473_323.04312719754) }

    specify do
      expect(subject.contains?(dublin)).to eq(true)
      expect(subject.contains?(bray)).to eq(true)
      expect(subject.contains?(lucan)).to eq(false)
    end
  end
end
