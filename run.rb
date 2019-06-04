require "json"
require "optparse"
require "haversine"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-i", "--input PATH", "Input file path") do |v|
    options[:input] = v
  end

  opts.on("-o", "--output PATH", "Output file path") do |v|
    options[:output] = v
  end
end.parse!

within_radius = []
centre = ::Haversine::Point.from_degrees(53.339428, -6.257664)
circle = ::Haversine::Circle.new(centre, 100_000.0)

File.open(options[:input], "r") do |f|
  f.each_line do |line|
    input = ::Haversine::Input.new(JSON.parse(line, symbolize_names: true))
    within_radius << input if circle.contains?(input.to_point)
  end
end

File.open(options[:output], "w") do |f|
  within_radius.sort { |x, y| x.user_id <=> y.user_id }.each do |input|
    f.write input.raw_data.to_json
    f.write "\n"
  end
end
