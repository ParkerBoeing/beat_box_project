class BeatBox
attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  # def play
  #   beats = list.to_string
  #   system("say -r 500 -v Boing '#{beats}'")
  # end

  def play
    beats = list.to_string
    `say -r 500 -v Boing #{beats}`
  end
end