require "./render.cr"
require "./map.cr"

class Frame
  include Map

  def initialize
    @all_lines = [] of Array(Pos)
    @all_lines = get_all_lines  # 这里填满 @all_lines

    @renderer = Render.new(@all_lines)
  end

   def start
    loop do
      print "\e[2J\e[H"
      STDOUT.flush
      @renderer.render
      # @renderer.update
      sleep 0.5
    end

  end

  def update
    @renderer.move_right
  end
end
