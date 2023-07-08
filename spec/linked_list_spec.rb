require "rspec"
require "./lib/node"
require "./lib/linked_list"

describe LinkedList do
  let (:list) {LinkedList.new}

  describe "#initialize" do
    it "can be a linked list" do
      expect(list).to be_a LinkedList
    end

    it "has no head by default" do
      expect(list.head).to eq(nil)
    end
  end

  describe "#append" do
    it "can append to the list" do
      list.append("doop")
    
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to eq(nil)
    end

    it "can append a second node" do
      list.append("doop")
      list.append("deep")

      #require 'pry';binding.pry

      expect(list.head.data).to eq("doop")
      expect(list.head.next_node.data).to eq("deep")
    end

    it "can append a third node" do
      list.append("doop")
      list.append("deep")
      list.append("do")

      expect(list.head.data).to eq("doop")
      expect(list.head.next_node.data).to eq("deep")
      expect(list.head.next_node.next_node.data).to eq("do")
    end
  end

  describe "#count" do
    it "returns 0 if there is no head" do
      expect(list.count).to eq(0)
    end

    it "returns 1 if there is no next node" do
      list.append("doop")

      expect(list.count).to eq(1)
    end

    it "can return more than 1" do
      list.append("doop")
      list.append("deep")

      expect(list.count).to eq(2)
    end
  end

  describe "#to_string" do
    it "will return nil if there is no head" do
      expect(list.to_string).to eq(nil)
    end

    it "can return a string if there is a head" do
      list.append("doop")

      expect(list.to_string).to eq("doop")
    end

    it "can return a string of multiple nodes" do
      list.append("doop")
      list.append("deep")

      expect(list.to_string).to eq("doop deep")
    end
  end

  describe "#prepend" do
    it "can prepend a node to the beginning of a list" do
      list.append("plop")

      expect(list.to_string).to eq("plop")

      list.append("suu")

      expect(list.to_string).to eq("plop suu")

      list.prepend("dop")

      expect(list.to_string).to eq("dop plop suu")
      expect(list.count).to eq 3
    end
  end

  describe "#insert" do
    it "can insert a node in the middle of a list"do
      list.append("plop")

      expect(list.to_string).to eq("plop")

      list.append("suu")

      expect(list.to_string).to eq("plop suu")

      list.prepend("dop")

      expect(list.to_string).to eq("dop plop suu")
      expect(list.count).to eq 3

      list.insert(1, "woo")

      expect(list.to_string).to eq("dop woo plop suu")

    end
  end

  describe "#find" do
    xit "can return an array" do
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.to_string).to eq("deep woo shi shu blop")
      expect(list.find(0, 5)).to eq(["deep", "woo", "shi", "shu", "blop"])
    end

    it "can return a given index position" do
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.find(2, 1)).to eq ("shi")
    end
  end
end