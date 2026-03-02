require "./line.cr"

class Square

  alias Pos = {Int32, Int32}

  @pos1 : Pos
  @pos2 : Pos
  @pos3 : Pos
  @pos4 : Pos

  def initialize(pos1, pos2, pos3, pos4)
    @pos1 = pos1
    @pos2 = pos2
    @pos3 = pos3
    @pos4 = pos4
  end

  def to_points : Array(Pos)
    points = [] of Pos

    points.concat(bre(@pos1, @pos2))
    points.concat(bre(@pos2, @pos3))
    points.concat(bre(@pos3, @pos4))
    points.concat(bre(@pos4, @pos1))

    points
 
  end

  def bre(p1 : Pos, p2 : Pos) : Array(Tuple(Int32, Int32))
    x0 = p1[0]; y0 = p1[1]
    x1 = p2[0]; y1 = p2[1]

    points = [] of Pos
    # Bresenham直线算法
    dx = (x1 - x0).abs
    dy = (y1 - y0).abs
    sx = x0 < x1 ? 1 : -1
    sy = y0 < y1 ? 1 : -1

    err = dx - dy

    x = x0
    y = y0

    while true
      points << {x, y}
      break if x == x1 && y == y1

      e2 = err * 2
      if e2 > -dy
        err -= dy
        x += sx
      end
      if e2 < dx
        err += dx
        y += sy
      end
    end

    points
  end


end
