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

  def move_left(time : Int32 = 1)
    (time).times do
      new_dots = @dots.map do |(x, y)|
        { x, y = y - 1 }
      end
      @dots = new_dots
    end
    self
  end

  def move_up(time : Int32 = 1)
    (time).times do
      new_dots = @dots.map do |(x, y)|
        { x = x - 1, y }
      end
      @dots = new_dots
    end
    self #确保返回类型为Render 
  end

end
