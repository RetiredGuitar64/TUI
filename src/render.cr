class Render

  MAX_X = 20
  MAX_Y = 70

  getter dots

  @dots : Array(Pos)

  def initialize(lines : Array(Array(Pos)))
    @dots = [] of Pos

    lines.each do |line|
      line.each do |dot|
        @dots << dot
      end
    end
  end

  def render
    dots_set = @dots.to_set  # 转成集合，优化一下性能
    (0..MAX_X).each do |x|
      (0..MAX_Y).each do |y|
        if dots_set.includes?({x, y})
          print "█"
        else
          print "."
        end
      end
      puts "\n"
    end
  end

  def move(time : Int32 = 1)
    (time).times do
      new_dots = @dots.map do |dot| 
        yield(dot)  # 将每一个dot抛出，交给后面的move_方向处理
      end
      @dots = new_dots
    end
    self
  end

  def move_left(time : Int32 = 1)
    move do |(x, y)|
      { x, y = y - 1}
    end
  end

  def move_right(time : Int32 = 1)
    move do |(x, y)|
      { x, y = y + 1}
    end
  end

  def move_up(time : Int32 = 1)
    move do |(x, y)|
      { x = x - 1, y }
    end
  end

  def move_down(time : Int32 = 1)
    move do |(x, y)|
      { x = x + 1, y}
    end
  end

end
