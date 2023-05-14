class LinkedList
  attr_reader :head

    def initialize
      @head = nil
    end

    # The below code is working by storing the information contained in head in a variable called node
    # As long as node.next_node contains data, find_tail will continue to search
    # For each time that the find_tail method checks for node.next_node, it simultaneously switches
    # the variable called node for the next node in the list, with the line node = node.next_node
    # In this way the find_tail method traverses each node looking for node.next_node = nil
    # which would delineate the end of the list
    def find_tail
      node = @head
      while node.next_node
        node = node.next_node
      end
      node
    end

    # The below code outlines an append method
    # It works by first checking if the head of the linked list contains data or is nil.
    # If there is no data at the head, then there is no need to search for tail and append data
    # so if @head = nil, it functions in a very simple fashion and turns @head into a new node
    # with the data given in the argument for append.
    # If head != nil then it enacts the find_tail method on the list object and then
    # enacts a method from the node class, which allows us to set the data of the next node 
    # to to data taken from the given argument
    def append(data)
      if @head
        find_tail.set_next_node(Node.new(data))
      else
        @head = Node.new(data)
      end
    end

    def to_string
      node = @head
      string = ""
      while node
        string += "#{node.data.to_s} "
        node = node.next_node
      end
      string.strip
    end

    def count
      node = @head
      amount = 0
      while node
        amount += 1
        node = node.next_node
      end
      amount
    end
end