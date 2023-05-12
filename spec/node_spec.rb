require "./lib/node"
require 'rspec'

describe Node do
  it 'exists' do
    node = Node.new("plop")
    expect(node).to be_instance_of(Node)
  end

  it 'contains data' do
    node = Node.new("plop")
    expect(node.data).to eq("plop")
  end

  it 'leads to a nil node' do
    node = Node.new("plop")
    expect(node.next_node).to eq(nil)
  end

end