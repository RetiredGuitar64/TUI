class Event

  getter event_ch

  def initialize
    @event_ch = Channel(Char | Nil).new
  end

  def check_input
    # STDIN.raw do |io|
    #   key = io.read_char
    #   if key
    #     @event_ch.send(key)
    #   end
    # end
  end
end
