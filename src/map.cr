require "./line.cr"
require "./square.cr"

module Map
  def get_all_lines
    @all_lines = [] of Array(Pos)
    line1 = Line.new({0, 0}, {20, 70})
    @all_lines << line1.to_points

    sq1 = Square.new({2,10},{18,16},{15,60},{3,55})
    @all_lines << sq1.to_points
  end
end
