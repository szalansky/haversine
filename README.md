# Haversine

## Development

This code does not have any external runtime dependencies and should work with any modern Ruby (2.x).

After cloning the repo run:

```
bundle install
```

To execute tests simply run:

```
bundle exec rspec
```

### Mutation testing

At the moment mutation coverage of `Haversine` module is 99.40%. That's because
Haversine formula uses a squared value of sinus function so this mutation is
a bit tricky to eliminate:

```
Haversine::Distance.between_points: ./lib/haversine/distance.rb:6
- rspec:1:./spec/haversine/distance_spec.rb:13/Haversine::Distance.between_points from A to A
- rspec:2:./spec/haversine/distance_spec.rb:24/Haversine::Distance.between_points from A to B
evil:Haversine::Distance.between_points:/Users/rafal.szalanski/Developer/haversine/lib/haversine/distance.rb:6:0ec1d
@@ -1,7 +1,7 @@
 def self.between_points(point_a, point_b)
   d_lat = (point_b.lat - point_a.lat)
   d_lon = (point_b.lon - point_a.lon)
-  val = ((Math.sin(d_lat / 2) ** 2) + ((Math.cos(point_a.lat) * Math.cos(point_b.lat)) * (Math.sin(d_lon / 2) ** 2)))
+  val = ((Math.sin(d_lat / (-2)) ** 2) + ((Math.cos(point_a.lat) * Math.cos(point_b.lat)) * (Math.sin(d_lon / 2) ** 2)))
   (2 * RADIUS) * Math.asin(Math.sqrt(val))
 end
-----------------------
evil:Haversine::Distance.between_points: ./haversine/lib/haversine/distance.rb:6:c0861
@@ -1,7 +1,7 @@
 def self.between_points(point_a, point_b)
   d_lat = (point_b.lat - point_a.lat)
   d_lon = (point_b.lon - point_a.lon)
-  val = ((Math.sin(d_lat / 2) ** 2) + ((Math.cos(point_a.lat) * Math.cos(point_b.lat)) * (Math.sin(d_lon / 2) ** 2)))
+  val = ((Math.sin(d_lat / 2) ** 2) + ((Math.cos(point_a.lat) * Math.cos(point_b.lat)) * (Math.sin(d_lon / (-2)) ** 2)))
   (2 * RADIUS) * Math.asin(Math.sqrt(val))
 end
-----------------------
```

To execute mutation tests for `Haversine` module simply run:

```
bundle exec mutant --include lib --require haversine --use rspec "Haversine*"
```

## Usage

To execute program run:

```
bundle exec ruby run.rb --input <path to input file> --output <path to output file>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
