require 'rspec'
require './lib/linked_list'

RSpec.describe LinkedList do
  describe '#initialize' do
    it 'exists' do
      list = LinkedList.new

      expect(list).to be_an_instance_of(LinkedList)
      expect(list.head).to eq(nil)
      expect(list.count).to eq(0)
      expect(list.tail).to eq(nil)
    end
  end

  describe '#append' do
    it 'appends the first sound as the head and tail' do
      list = LinkedList.new
      list.append('doop')

      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to eq(nil)
      expect(list.count).to eq(1)
      expect(list.tail).to eq(list.head)
    end

    it 'appends a second node as the next node' do
      list = LinkedList.new
      list.append('doop')
      list.append('deep')
      

      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to be_a(Node)
      expect(list.head.next_node.data).to eq('deep')
      expect(list.count).to eq(2)
    end

    it 'appends a multiple nodes' do
      list = LinkedList.new
      list.append('doop')
      list.append('deep')
      list.append('bop')

      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq('doop')
      expect(list.tail.data).to eq('bop')
      expect(list.count).to eq(3)
    end
  end

  describe '#to_string' do
    it 'make a string of list nodes data' do
      list = LinkedList.new
      list.append('doop')
      list.append('doop')
      list.append('deep')
      list.append('dop')
      list.append('doop')
      list.append('doo')
      list.append('dah')
      list.append('deep')
      list.append('dop')


      expect(list.to_string).to eq('doop doop deep dop doop doo dah deep dop')
    end

    it 'alerts if list is empty' do
      list = LinkedList.new

      expect(list.to_string).to eq('The list is empty.')
    end
  end

  describe '#prepend' do
    it 'adds a node to the beginning of the list' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')

      expect(list.to_string).to eq('dop plop suu')
      expect(list.count).to eq(3)
    end

    it 'adds a sound as the head and tail if the list is empty' do
      list = LinkedList.new
      list.prepend('doop')

      expect(list.head).to be_a(Node)
      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to eq(nil)
      expect(list.count).to eq(1)
      expect(list.tail).to eq(list.head)
    end
  end

  describe '#insert' do
    it 'adds a node to a given position in the list' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(1, 'woo')

      expect(list.to_string).to eq('dop woo plop suu')
      expect(list.count).to eq(4)
    end

    it 'prepends a node if insert to 0' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(0, 'woo')

      expect(list.to_string).to eq('dop woo plop suu')
      expect(list.count).to eq(4)
    end

    it 'appends a node if insert to tail' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(3, 'woo')

      expect(list.to_string).to eq('dop plop suu woo')
      expect(list.count).to eq(4)
    end

    it 'sends error message if the list is empty' do
      list = LinkedList.new
      
      expect(list.insert(1, 'woo')).to eq('The list is empty.')
    end

    it 'sends error message if insert past list length' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      
      expect(list.insert(10, 'woo')).to eq('The insert position number is greater than the length of this list.')
    end
  end

  describe '#find' do
    it 'finds a node at given position and prints requested number of nodes' do
      list = LinkedList.new
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      expect(list.find(2, 1)).to eq('shi')
      expect(list.find(1, 3)).to eq('woo shi shu')
    end

    it 'checks if find is called on empty list' do
      list = LinkedList.new
      
      expect(list.find(2, 1)).to eq('The list is empty. Please try again.')
    end

    it 'checks requested starting sound position and returned sound count' do
      list = LinkedList.new
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      expect(list.find(10, 1)).to eq("The list only has #{list.count} sounds.. Please try again.")
      expect(list.find(2, 6)).to eq("The list only has #{list.count} sounds.. Please try again.")
    end

  end

  describe '#includes?' do
    it 'checks if sound is in list' do
      list = LinkedList.new
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      expect(list.includes?('blop')).to eq(true)
      expect(list.includes?('dep')).to eq(false)
    end

    it 'returns false if list is empty' do
      list = LinkedList.new

      expect(list.includes?('deep')).to eq('The list is empty.')
    end
  end

  describe '#pop' do
    it 'removes the last element' do
      list = LinkedList.new
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')
      list.pop

      expect(list.to_string).to eq('deep woo shi shu')
    end

    it 'returns the sound popped' do
      list = LinkedList.new
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      expect(list.pop).to eq('blop')
    end

    it 'pops the only sound in the list' do
      list = LinkedList.new
      list.append('deep')
      
      expect(list.pop).to eq('deep')
      expect(list.head).to be_nil
      expect(list.tail).to be_nil
    end

    it 'checks if the list is empty' do
      list = LinkedList.new
      
      expect(list.pop).to eq('The list is empty.')
    end
  end
end