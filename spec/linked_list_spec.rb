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
end