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

  (MAX_X+1).times do
    (MAX_Y+1).times do
      print renderer.ch.receive
    end
    puts "\n"
  end
  # print "\e[2J\e[H"
  # STDOUT.flush

# pp renderer.dots

