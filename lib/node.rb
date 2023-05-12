class Node
  attr_reader :data,
              :next_node
  
  def initialize(data)
    @data = data
  end

  def next_node
  end

  def to_string
    puts @data
  end
end  



  # using the attr_accessor spares me from having 
  # to write the following method:
  # def next_node
  # end
