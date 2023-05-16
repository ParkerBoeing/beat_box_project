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
      current_node = @head
      current_node = current_node.next_node while current_node.next_node
      current_node
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
      beats = data.split(" ")
      beats.each do |beat|
        new_node = Node.new(beat)
        if @head
        find_tail.set_next_node(new_node)
        else
        @head = new_node
        end
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
      new_node = Node.new(data)
      new_node.set_next_node(@head)
      @head = new_node
    end

    def to_string
      current_node = @head
      string = ""
      while current_node
        string += "#{current_node.data} "
        current_node = current_node.next_node
      end
      string.strip
    end

    def count
      current_node = @head
      amount = 0
      while current_node
        amount += 1
        current_node = current_node.next_node
      end
      amount
    end


    # With the insert method, it may become necessary to distinguish between 
    # previously instantiated nodes and newly instantiated nodes as this is the first method
    # I've created in which that distinguishment matters.
    # To keep it consistent I should go back through my old code and ensure that 
    # newly instantiated nodes are delineated as such

    # Having taken the above advice it is now much more clear how each method is functioning
    # pay attention to these time savers in the future.

    # the method below is operating in the following way:
    # the first three lines tell the loop where to begin and sets up a counter
    # so that the proper index position will be delineated.

    # The while loop says that as long as the current node isn't nil
    # and the index counter is less than the number contained in the variable index
    # when passed in by the user as an argument

    # The loop traverses the list and counts up until the index position
    # is that given by the user.
    def insert(index, data)
      current_node = @head
      previous_node = nil
      index_counter = 0

    # accounts for user error / faulty input 
      return "Index position too high. Must insert node at index position <= #{count}" if index > count
   
    # the current node gets put into the variable previous node,
    # then the node ahead of it gets placed into the current nodes position
    # until the index counter equals the index given.
    # it is possible to take out the current node && and leave just index_counter < index
      while index_counter < index
        previous_node = current_node
        current_node = current_node.next_node
        index_counter += 1
      end
    # Once the index counter equals the index passed in as an argument
    # a new node is created
    # the current node at the given index position becomes set
    # as the node after the new node by using the set next node method
    # and passing the current node in as an argument
    # The new node is then set as the next node of the previous node
    # thus completing it's full tie in to the linked list
      if index_counter == index
        new_node = Node.new(data)
        new_node.set_next_node(current_node)
        # the if statement below accounts for putting the inserted node at the head
        # even if a node exists there already
        previous_node.set_next_node(new_node) if previous_node

        # whereas this if statement will simply set the head as the inserted node
        # without trying to reassign any other nodes as the line above
        # will not run if there is no previous node
        @head = new_node if index == 0
      end
    end

    def includes?(value)
      current_node = @head
      while current_node
        if current_node.data == value
          return true
        end
        current_node = current_node.next_node
      end
      false
    end

    # By invoking this method first thing in my other methods for linked lists
    # it will help avoid edge cases and give more information when people
    # try to run methods on empty lists.
    # I could definitely use it in at least the insert and pop methods

    def is_empty?
      if @head == nil
          return true
        else
          return false
      end
    end

    def pop
      # the code below checks to see if the list is empty and returns 
      # "Empty list" if so
      if head.nil?
          return "Empty list"
      end
      
      # the code below checks to see if there is one node in the list
      # if so, it takes the data from the node and stores it in the variable
      # called data, the first node is then set to nil and the return value
      # is set to the value of the data taken from the node
      if head.next_node.nil?
        data = @head.data
        @head = nil
        return data
      end
      # the code below sets our place in the list and gets us prepared to traverse to the end
      current_node = @head
      previous_node = nil
      
      # Moves through list to find the last node
      while current_node.next_node
          previous_node = current_node
          current_node = current_node.next_node
      end
      
      # sets the previous node to point to nil, effectively making the previous node
      # the new end of the list
      previous_node.set_next_node(nil)

      # returns data from removed node
      current_node.data
    end

    def find(index, amount)
      current_node = @head
      result = " "
      index_counter = 0

        while index_counter < index + amount
          result += "#{current_node.data} " if index_counter >= index
          current_node = current_node.next_node
          index_counter += 1
        end
      result.strip
    end
  end