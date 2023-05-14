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

    # The prepend method works by creating a new node with the given data
    # it then sets the head node to be the next node in the linked list
    # the code does this by invoking the set_next_node function on the newly instantiated node
    # the set_next_node method then takes the current (soon to be former) @head node
    # and sets it to be the next node in the linked list
    # the method then sets the newly instantiated node to be contained in the now empty head variable
    # and this newly instantiated node contains the data passed in via the invoked prepend method

    # Sub note to the above: I found a snippet of code online that used an if / else conditional
    # that looks like this:   if @head
    #                         new_node.set_next_node(@head)
    #                         end
    # I suspected that the reason was to determine if the list was empty, as that might 
    # render issues with the code as I have it however, it did not render any issues because
    # it will just create a nil node at the end of the list as @head = nil is a given value of the
    # instantiated list. I suspected the system might complain that @head nil wasn't a valid argument
    # I include this sub note for documentation purposes to my future self, in case the code I'm using
    # breaks upon further testing and a conditional does in fact need to be used.
    def prepend(data)
      node = Node.new(data)
      node.set_next_node(@head)
      @head = node
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