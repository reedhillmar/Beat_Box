require "rspec"
require "./lib/node"

describe Node do
  let(:node) {Node.new("plop")}
  
  describe "initialize" do
    it "can be a node" do
      expect(node).to be_a Node
    end

    it "can have data" do
      expect(node.data).to eq("plop")
    end

    it "has no next node as default" do
      expect(node.next_node).to eq(nil)
    end
  end
end