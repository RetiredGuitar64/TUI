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
    @event.check_input
    loop do
      # 清屏
      print "\e[2J\e[H"
      STDOUT.flush

      # 渲染
      @renderer.render

      Fiber.yield

      update

      break if @event.event_ch.receive? == 'Q'
    end

  end

  def update
    key = @event.event_ch.receive?
    case key
    when 'w'
      @renderer.move_up
    end
  end

end
