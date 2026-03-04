# require "termisu"
require "./line.cr"
require "./render.cr"
require "./square.cr"

all_lines = [] of Array(Pos)

line1 = Line.new({0, 0}, {20, 70})
all_lines << line1.to_points

sq1 = Square.new({2,10},{18,16},{15,60},{3,55})
all_lines << sq1.to_points


# 渲染
renderer = Render.new(all_lines)

renderer.render

10.times do
  print "\e[2J\e[H"
  STDOUT.flush
  renderer.move_down.render
  sleep 0.5
end

10.times do
  print "\e[2J\e[H"
  STDOUT.flush
  renderer.move_up.render
  sleep 0.5
end

# pp renderer.dots

