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
    end
  end
end