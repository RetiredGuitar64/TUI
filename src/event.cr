class Event

  getter event_ch, status_ch

  def initialize
    @event_ch = Channel(Char | Nil).new
    @status_ch = Channel(String).new
  end

  def check_input
    spawn do
      loop do
        Fiber.yield if @status_ch.receive == "sleep end"

        STDIN.raw do |io|
          key = io.read_char
          if key
            @event_ch.send(key)
          end
        end
      end
    end
  end
end
