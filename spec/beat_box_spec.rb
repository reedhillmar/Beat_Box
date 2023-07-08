require "rspec"
require "./lib/node"
require "./lib/linked_list"
require "./lib/beat_box"

describe BeatBox do
  let (:bb) {BeatBox.new}

  describe "#initialize" do
    it "can exist" do
      expect(bb).to be_a BeatBox
      expect(bb).to eq(bb)
    end

    it "can have a list" do
      expect(bb.list).to be_a LinkedList
    end

    it "starts with no nodes as default" do
      expect(bb.list.head).to eq(nil)
    end
  end

  describe "#append" do
    it "can append a string into a linked list" do
      bb.append("deep doo ditt")

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
    end

    it "can appened another string into a linked list" do
      bb.append("deep doo ditt")

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
      
      bb.append("woo hoo shu")
# require 'pry';binding.pry
      expect(bb.list.count).to eq(6)
      # require 'pry';binding.pry
      expect(bb.count).to eq(6)
    end
  end
end