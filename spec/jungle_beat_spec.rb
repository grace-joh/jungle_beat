require 'rspec'
require './lib/jungle_beat'

RSpec.describe JungleBeat do

  describe '#initialize' do

    it 'exists' do
      jb = JungleBeat.new

      expect(jb).to be_an_instance_of(JungleBeat)
      expect(jb.list).to be_an_instance_of(LinkedList)
      expect(jb.list.head).to be_nil
    end

    it 'returns the numbers of sounds in a list' do
      jb = JungleBeat.new
      jb.append("deep doo ditt")
      jb.append("woo hoo shu")

      expect(jb.count).to eq(6)
    end

    it 'appends every sound it is initialized with' do
      jb = JungleBeat.new("deep")

      expect(jb.all).to eq("deep")
    end

    it 'has a default of no sounds' do
      jb = JungleBeat.new

      expect(jb.all).to eq("")
    end
  end

  describe '#all' do

    it 'returns all the sounds in the list' do
      jb = JungleBeat.new("deep")
      jb.append("deep")

      expect(jb.all).to eq("deep deep")
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

    it 'omits any word not in defined list' do
      jb = JungleBeat.new
      jb.append("Mississippi")

      expect(jb.count).to eq(0)
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

  describe '#play' do

    it 'returns the numbers of sounds in a list' do
      jb = JungleBeat.new
      jb.append("deep doo ditt")
      jb.append("woo hoo shu")

      expect(jb.play)
    end
  end

  describe '#valid_beats' do
    it 'checks if the sound is in the list' do
      jb = JungleBeat.new

      expect(jb.valid_beat?("deep")).to eq("deep")
      expect(jb.valid_beat?("Mississippi")).to eq(nil)
      
    end
  end
end