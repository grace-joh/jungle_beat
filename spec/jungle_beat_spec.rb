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

    it 'has a default rate of 500' do
      jb = JungleBeat.new("deep")

      expect(jb.rate).to eq(500)
    end

    it 'has a default voice of Boing' do
      jb = JungleBeat.new("deep")

      expect(jb.voice).to eq("Boing")
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

  describe "prepend" do
    it 'prepends multiple sounds' do
      jb = JungleBeat.new
      jb.append("woo hoo shu")
      jb.prepend("deep doo ditt")

      expect(jb.all).to eq("deep doo ditt woo hoo shu")
    end

    it 'omits any word not in defined list' do
      jb = JungleBeat.new("deep")

      expect(jb.prepend("Mississippi")).to eq(0)
    end
  end

  describe '#reset_rate' do
    it 'changes the rate back to 500' do
      jb = JungleBeat.new("deep dop dop deep")
      jb.rate = 100

      expect(jb.reset_rate).to eq(500)
    end
  end

  describe '#reset_voice' do
    it 'changes the voice back to Boing' do
      jb = JungleBeat.new("deep dop dop deep")
      jb.voice = "Daniel"

      expect(jb.reset_voice).to eq("Boing")
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