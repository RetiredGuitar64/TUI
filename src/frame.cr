require "./render.cr"
require "./map.cr"
require "./event.cr"

class Frame
  include Map

  def initialize
    # 初始化地图
    @all_lines = [] of Array(Pos)
    @all_lines = get_all_lines  # 这里填满 @all_lines

    # 初始化渲染器
    @renderer = Render.new(@all_lines)

    # 初始化键盘监测
    @event = Event.new
  end

  def start
    loop do
      print "\e[2J\e[H"
      STDOUT.flush

      @renderer.render
      update

      sleep 0.5
    end

  end

  def update
    key = @event.event_ch.receive?
  end
end
