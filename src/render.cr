MAX_X = 20
MAX_Y = 70

class Render
  getter dots, ch

  @dots : Array(Pos)
  @ch : Channel(String)

  def initialize(lines : Array(Array(Pos)))
    @dots = [] of Pos
    @ch = Channel(String).new()

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
          spawn do 
            @ch.send "█"
          end
        else
          spawn do
            @ch.send "."
          end
        end
      end
    end
  end

end
