class LinkedList
  attr_reader :head

    def initialize
      @head = nil
    end

    def find_tail
      current_node = @head
      current_node = current_node.next_node while current_node.next_node
      current_node
    end

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

    def insert(index, data)
      current_node = @head
      previous_node = nil
      index_counter = 0

      return "Index position too high. Must insert node at index position <= #{count}" if index > count
   
      while index_counter < index
        previous_node = current_node
        current_node = current_node.next_node
        index_counter += 1
      end

      if index_counter == index
        new_node = Node.new(data)
        new_node.set_next_node(current_node)
        previous_node.set_next_node(new_node) if previous_node
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

    def is_empty?
      if @head == nil
          return true
        else
          return false
      end
    end

    def pop
      if head.nil?
          return "Empty list"
      end
      
      if head.next_node.nil?
        data = @head.data
        @head = nil
        return data
      end
      
      current_node = @head
      previous_node = nil
      
      while current_node.next_node
          previous_node = current_node
          current_node = current_node.next_node
      end
      
      previous_node.set_next_node(nil)
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