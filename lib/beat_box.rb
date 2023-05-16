class BeatBox
attr_reader :list

  def initialize
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
  end

  # def play
  #   beats = list.to_string
  #   system("say -r 500 -v Boing '#{beats}'")
  # end

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
endst