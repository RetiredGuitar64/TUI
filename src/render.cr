class Render

  MAX_X = 20
  MAX_Y = 70

  alias Pos = {Int32, Int32}

  getter dots

  @dots : Array(Pos)

  def initialize
    @dots = [] of Pos
  end

  def get_all_dots(lines : Array(Array(Pos)))
    lines.each do |line|
      line.each do |dot|
        @dots << dot
      end
    end
  end

  def render
    (0..MAX_X).each do |x|
      (0..MAX_Y).each do |y|
        if @dots.includes?({x, y})
          print "#"
        else
          print "."
        end
      end
      puts "\n"
    end
  end

end
