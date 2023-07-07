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
  end

  describe "#count" do
    it "returns 0 if there is no head" do
      expect(list.count).to eq(0)
    end

    it "returns 1 if there is no next node" do
      list.append("doop")

      expect(list.count).to eq(1)
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
  end
end