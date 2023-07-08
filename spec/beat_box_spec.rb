require "rspec"
require "./lib/node"
require "./lib/linked_list"
require "./lib/beat_box"

describe BeatBox do
  let (:bb) {BeatBox.new}
  describe "#initialize" do
    it "can exist" do
      bb = BeatBox.new

      expect(bb).to be_a BeatBox
      expect(bb).to eq(bb)
    end

    it "can have a list" do
      expect(bb.list).to be_a LinkedList
      expect(bb.list).to eq(@list)
    end

    it "starts with no nodes as default" do
      expect(bb.list.head).to eq(nil)
    end
  end
end