require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do

  describe '#initialize' do

    it 'exists' do
      list = LinkedList.new

      expect(list).to be_an_instance_of(LinkedList)
    end

    it 'has a head node with default nil' do
      list = LinkedList.new

      expect(list.head).to eq(nil)
    end
  end

  describe '#append' do

    it 'appends the first sound as the head node' do
      list = LinkedList.new
      list.append("doop")

      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to eq(nil)
      expect(list.count).to eq(1)
      expect(list.tail).to eq(list.head)
    end

    it 'appends a second node as the next node' do
      list = LinkedList.new
      list.append("doop")
      list.append("deep")
      

      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to be_a(Node)
      expect(list.head.next_node.data).to eq("deep")
      expect(list.count).to eq(2)
    end

    it 'appends a multiple nodes' do
      list = LinkedList.new
      list.append("doop")
      list.append("deep")
      list.append("bop")

      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq("doop")
      expect(list.tail.data).to eq("bop")
      expect(list.count).to eq(3)
    end
  end

  describe '#to_string' do

    it 'make a string of list nodes data' do
      list = LinkedList.new
      list.append("doop")
      list.append("doop")
      list.append("beep")
      list.append("bop")
      list.append("doop")
      list.append("doo")
      list.append("dah")
      list.append("beep")
      list.append("bop")


      expect(list.to_string).to eq("doop doop beep bop doop doo dah beep bop")
    end
  end

  describe '#prepend' do
    it 'adds a node to the beginning of the list' do
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")

      expect(list.to_string).to eq("dop plop suu")
      expect(list.count).to eq(3)
    end
  end

  describe '#insert' do
    it 'adds a node to a given position in the list' do
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
      list.insert(1, "woo")

      expect(list.to_string).to eq("dop woo plop suu")
      expect(list.count).to eq(4)
    end

    it 'adds a node if the list is empty' do
      list = LinkedList.new
      list.insert(1, "woo")

      expect(list.to_string).to eq("woo")
      expect(list.count).to eq(1)
    end

    it 'prepends a node if insert to 0' do
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
      list.insert(0, "woo")

      expect(list.to_string).to eq("woo dop plop suu")
      expect(list.count).to eq(4)
    end

    it 'appends a node if insert to tail' do
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
      list.insert(3, "woo")

      expect(list.to_string).to eq("dop plop suu woo")
      expect(list.count).to eq(4)
    end

    it 'appends a node if insert to past tail with alert' do
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
      list.insert(10, "woo")

      expect(list.to_string).to eq("dop plop suu woo")
      expect(list.count).to eq(4)
    end
  end

  describe '#find' do

    it 'finds a node at given position and prints requested number of nodes' do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.find(2, 1)).to eq("shi")
      expect(list.find(1, 3)).to eq("woo shi shu")
    end

    # edge case - list is empty
    it 'checks if find is called on empty list' do
      list = LinkedList.new
      
      expect(list.find(2, 1)).to eq("The list is empty! Please try again.")
    end

    # edge case - position of first requested node is greater than list count
    # edge case - number of returned sounds wanted is more than existing list
    it 'checks requested starting sound position and returned sound count' do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.find(10, 1)).to eq("The list only has #{list.count} sounds.. Please try again.")
      expect(list.find(2, 6)).to eq("The list only has #{list.count} sounds.. Please try again.")
    end

  end

  describe '#includes?' do

    it 'checks if sound is in list' do
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.includes?("blop")).to eq(true)
      expect(list.includes?("dep")).to eq(false)
    end

    it 'returns false if list is empty' do
      list = LinkedList.new

      expect(list.includes?("deep")).to eq(false)
      expect(list.includes?("dep")).to eq(false)
    end
  end
end