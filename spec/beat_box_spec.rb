require "./lib/node"
require "./lib/linked_list"
require "./lib/beat_box"
require "rspec"

describe BeatBox do
  it "exists" do
    bb = BeatBox.new
    expect(bb).to be_instance_of(BeatBox)
  end

  it "contains an empty linked list" do
    bb = BeatBox.new
    expect(bb.list.head).to eq(nil)
  end

  it "can take multiple appends and input them as nodes in the list" do
    bb = BeatBox.new
    bb.list.append("deep doo ditt")
    expect(bb.list.to_string).to eq("deep doo ditt")
    expect(bb.list.count).to eq(3)
  end

  it "can find the head of the list after inputting multiple nodes at once" do
    bb = BeatBox.new
    bb.list.append("deep doo ditt")
    expect(bb.list.head.data).to eq("deep")
  end

  it "can shuffle through the nodes using the next node method" do
    bb = BeatBox.new
    bb.list.append("deep doo ditt")
    expect(bb.list.head.next_node.data).to eq("doo")
  end

  it "can append another chunk of multiple nodes" do
    bb = BeatBox.new
    bb.list.append("deep doo ditt")
    bb.list.append("woo hoo shu")
    expect(bb.list.to_string).to eq("deep doo ditt woo hoo shu")
  end

  it "can properly count all those nodes" do
    bb = BeatBox.new
    bb.list.append("deep doo ditt")
    bb.list.append("woo hoo shu")
    expect(bb.list.count).to eq(6)
  end
end