# require "termisu"
require "./line.cr"
require "./render.cr"

alias Pos = {Int32, Int32}

all_lines = [] of Array(Pos)

line1 = Line.new({0,0}, {50, 15})


all_lines << line1.to_points

# 渲染
renderer = Render.new
renderer.get_all_dots(all_lines)

renderer.render

# pp renderer.dots

