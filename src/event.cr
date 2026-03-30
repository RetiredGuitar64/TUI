class Event

  getter event_ch, status_ch

  def initialize
    @event_ch = Channel(Char | Nil).new
    @status_ch = Channel(Symbol).new
  end

  def check_input
    spawn do
      10.times do

        STDIN.raw do |io|
          key = io.read_char
          if key
            @event_ch.send(key)
          end
        end
      end
      Fiber.yield
    end
  end
end
