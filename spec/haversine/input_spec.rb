require "spec_helper"
require "haversine/input"

RSpec.describe ::Haversine::Input do
  let(:data) do
    {
      latitude: "52.9863750",
      user_id: "12",
      name: "John Smith",
      longitude: "-6.043701"
    }
  end

  subject { described_class.new(data) }

  specify do
    expect(subject.lat).to eq(52.986375)
    expect(subject.lon).to eq(-6.043701)
    expect(subject.user_id).to eq(12)
    expect(subject.name).to eq("John Smith")
    expect(subject.raw_data).to eq(data)
  end

  describe "#to_point" do
    specify do
      point = subject.to_point

      expect(point.lat).to eq(0.9247867024464105)
      expect(point.lon).to eq(-0.10548248145607382)
    end
  end
end
