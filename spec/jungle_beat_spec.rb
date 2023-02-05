require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'

RSpec.describe JungleBeat do

  describe '#initialize' do

    it 'exists' do
      jb = JungleBeat.new

      expect(jb).to be_an_instance_of(JungleBeat)
      expect(jb.list).to be_an_instance_of(LinkedList)
      expect(jb.list.head).to be_nil
    end
  end

  describe '#append' do
    
    it 'makes nodes for each sound in a given string' do
      jb = JungleBeat.new
      jb.append("deep doo ditt")

      expect(jb.list.head.data).to eq("deep")
      expect(jb.list.head.next_node.data).to eq("doo")
      expect(jb.list.head.next_node.next_node.data).to eq("ditt")
    end
  end

  describe '#count' do

    it 'returns the numbers of sounds in a list' do
      jb = JungleBeat.new
      jb.append("deep doo ditt")
      jb.append("woo hoo shu")

      expect(jb.count).to eq(6)
    end
  end
end