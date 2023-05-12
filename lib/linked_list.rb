class LinkedList
  attr_reader :head

    def initialize
      @head = nil
    end

    def append(data)
      @head = Node.new(data)
    end

    def to_string
      node = @head
      "#{node.data.to_s}"
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