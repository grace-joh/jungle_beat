require './lib/linked_list'

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

end