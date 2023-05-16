class Node
  attr_reader :data,
              :next_node
  
  def initialize(data)
    @data = data
  end

  def set_next_node(data) 
    @next_node = data
  end

end  




