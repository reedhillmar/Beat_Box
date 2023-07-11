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

    it "can start with nodes" do
      bb = BeatBox.new("deep doo dop doo deep")
      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
      expect(bb.list.head.next_node.next_node.data).to eq("doo")
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

    it "can append a string and remove invalid beats" do 
      bb.append("deep doo dop doo deep")

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
      expect(bb.list.head.next_node.next_node.data).to eq("doo")
    end
  end

  describe "#play" do
    #temporary test to confirm beats is accepting the string properly
    # it "can accept a string to play" do
    #   bb.append("deep doo ditt woo hoo shu")

    #   expect(bb.play).to eq("deep doo ditt woo hoo shu")
    # end

    it "can play a sound" do
      bb.append("deep doo ditt woo hoo shu")

      bb.play
    end
  end

  describe "#all" do
    it "can return all nodes in a list as a string" do
      bb.append("deep doo ditt")

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
      
      bb.append("woo hoo shu")

      expect(bb.all).to eq("deep doo ditt woo hoo shu")
    end
  end

  describe "#prepend" do
    it "can prepend a string into a linked list" do
      bb.append("deep doo ditt")
      bb.prepend("woo")

      expect(bb.list.head.data).to eq("woo")
      expect(bb.list.head.next_node.data).to eq("deep")
    end

    it "can prepend multiple elements into a linked list" do
      bb.append("deep doo ditt")

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
      
      bb.prepend("woo hoo")
  # require 'pry';binding.pry
      expect(bb.list.head.data).to eq("woo")
      expect(bb.list.head.next_node.data).to eq("hoo")
      expect(bb.list.head.next_node.next_node.data).to eq("deep")
    end

    it "can prepend multiple elements while removing ones that aren't allowed" do
      bb.append("deep doo ditt")

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
      
      bb.prepend("woo whiskey hoo")
      expect(bb.list.head.data).to eq("woo")
      expect(bb.list.head.next_node.data).to eq("hoo")
      expect(bb.list.head.next_node.next_node.data).to eq("deep")
    end
  end

  xdescribe "#reset_rate & #reset_voice" do
    it "can play at different rates and voices" do
      bb.append("deep doo ditt woo hoo shu")

      bb.rate = 100
      bb.voice = "Daniel"

      bb.play
    end

    it "can reset rate and voice to default values" do
      bb.append("deep doo ditt woo hoo shu")

      bb.rate = 100
      bb.voice = "Daniel"

      bb.play

      bb.reset_rate
      bb.reset_voice

      bb.play
    end

    it "can let the user know if a voice isn't permitted" do
      bb.append("deep doo ditt woo hoo shu")

      bb.rate = 100
      bb.voice = "Balthazar"

      expect(bb.play_test).to eq("Your voice is invalid.")
    end

    it "can let the user know if a rate isn't permitted" do
      bb.append("deep doo ditt woo hoo shu")

      bb.rate = "Fifty"
      bb.voice = "Reed"
# require 'pry';binding.pry
      expect(bb.play_test).to eq("Your rate is invalid.")
    end
  end
end