class Line

  alias Pos = {Int32, Int32}

  @from : Pos
  @to : Pos

  def initialize(from, to)
    @from = from
    @to = to
  end

  def to_points : Array(Pos)
    points = [] of Pos

    x0 = @from[0]
    y0 = @from[1]

    x1 = @to[0]
    y1 = @to[1]

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
