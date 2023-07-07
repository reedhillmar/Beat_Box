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
end