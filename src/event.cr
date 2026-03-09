class Event

  getter event_ch

  def initialize
    @event_ch = Channel(Char | Nil).new

    STDIN.raw do |io|
      # loop do
      #   key = io.read_char
      #   break if key == 'q'
      #   @event_ch.send(key)
      # end
    end

  end
end
