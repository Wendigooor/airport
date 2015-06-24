
10.times do |i|
  Plane.create(name: "Plane_#{i}", time_for_takeoff: 10 + i)
end
