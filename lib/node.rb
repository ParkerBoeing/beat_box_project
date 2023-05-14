class Node
  attr_reader :data,
              :next_node
  
  def initialize(data)
    @data = data
    @next_node = nil
  end


  # The below code is in lieu of an attr_accessor line at the top. What this does
  # is allow the append method to push data into the next_node
  def set_next_node(data) 
    @next_node = data
  end

end  




