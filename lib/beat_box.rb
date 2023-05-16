class BeatBox
attr_reader :list

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
  end

  def change_rate(rate)
    @rate = rate
  end

  def reset_rate
    @rate = 500
  end

  def change_voice(voice)
    @voice = voice
  end

  def reset_voice
    @voice = "Boing"
  end

  def play
    beats = list.to_string
    `say -r #{@rate} -v #{@voice} #{beats}`
  end
end