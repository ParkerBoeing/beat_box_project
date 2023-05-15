require "./lib/node"
require "./lib/linked_list"
require "rspec"

describe LinkedList do
  it 'exists' do
    list = LinkedList.new
    expect(list).to be_instance_of(LinkedList)
  end

  it 'is an empty list' do
    list = LinkedList.new
  
    expect(list.head).to eq(nil)
  end

  it 'has an append method' do
    list = LinkedList.new
    list.append("doop")
    expect(list.head.data).to eq("doop")
  end

  it 'can point to another empty node' do
    list = LinkedList.new
    list.append("doop")
    expect(list.head.next_node).to eq(nil)
  end

  it 'can count the pieces of data in the linked list' do
    list = LinkedList.new
    list.append("doop")
    expect(list.count).to eq(1)
  end

  it 'can convert the linked list into a string' do
    list = LinkedList.new
    list.append("doop")
    expect(list.to_string).to eq("doop")
  end
  
  it 'can find tail' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.find_tail.data).to eq("deep")
  end

  it 'can append multiple nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.count).to be > 1
  end

  it 'can count the number of nodes' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.count).to eq(2)
  end

  it 'can turn the list to string' do
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expect(list.to_string).to eq("doop deep")
  end

  it 'can prepend a node containing data' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expect(list.head.data).to eq("dop")
  end

  it 'can prepend a node containing data even with an empty list' do
    list = LinkedList.new
    list.prepend("dop")
    expect(list.head.data).to eq("dop")
  end

  it 'can count the correct number of nodes after using append and prepend methods' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expect(list.count).to eq(3)
  end

  it 'can insert a node at a given index position' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")
    expect(list.head.next_node.data).to eq("woo")
  end

  it 'can insert a node at a given index position in an empty list' do
    list = LinkedList.new
    list.insert(0, "woo")
    expect(list.head.data).to eq("woo")
  end

  it 'provide feedback if index position doesnt exist' do
    list = LinkedList.new
    expect(list.insert(1, "woo")).to eq("Index position too high. Must insert node at index position <= 0")
  end

  it 'can turn the list of four instantiated nodes into a string' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")
    expect(list.to_string).to eq("dop woo plop suu")
  end

  it 'can check for empty list boolean' do
    list = LinkedList.new
    expect(list.is_empty?).to eq(true)
  end

  it 'can return false if theres a node in a list' do
    list = LinkedList.new
    list.append("plop")
    expect(list.is_empty?).to eq(false)
  end

  it 'can return true when looking for a piece of data in the list' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")
    expect(list.includes?("plop")).to eq(true)
  end

  it 'can return false when the data is not included in the list' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")
    expect(list.includes?("zap")).to eq(false)
  end

  it 'can pop a node from the list' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")
    list.pop
    expect(list.includes?("suu")).to eq(false)
    expect(list.to_string).to eq("dop woo plop")
  end

  it 'can return the value of the popped node' do
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")
    expect(list.pop).to eq("suu")
  end

end