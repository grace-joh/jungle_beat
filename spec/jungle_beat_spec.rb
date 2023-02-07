require 'rspec'
require './lib/jungle_beat'

RSpec.describe JungleBeat do
  describe '#initialize' do
    it 'exists with default values' do
      jb = JungleBeat.new

      expect(jb).to be_an_instance_of(JungleBeat)
      expect(jb.list).to be_an_instance_of(LinkedList)
      expect(jb.rate).to eq(500)
      expect(jb.voice).to eq('Boing')
      expect(jb.all).to eq('The list is empty.')
    end

    it 'exists with init_sounds argument' do
      jb = JungleBeat.new
      jb.append('deep doo ditt')
      jb.append('woo hoo shu')

      expect(jb).to be_an_instance_of(JungleBeat)
      expect(jb.count).to eq(6)
      expect(jb.rate).to eq(500)
      expect(jb.voice).to eq('Boing')
      expect(jb.all).to eq('deep doo ditt woo hoo shu')
    end
  end

  describe '#all' do
    it 'returns all the sounds in the list' do
      jb = JungleBeat.new('deep')
      jb.append('deep')

      expect(jb.all).to eq('deep deep')
    end

    it 'alerts if the list is empty' do
      jb = JungleBeat.new

      expect(jb.all).to eq('The list is empty.')
    end
  end

  describe '#append' do
    it 'makes nodes for each sound in a given string' do
      jb = JungleBeat.new
      jb.append('deep doo ditt')

      expect(jb.list.head.data).to eq('deep')
      expect(jb.list.head.next_node.data).to eq('doo')
      expect(jb.list.head.next_node.next_node.data).to eq('ditt')
    end

    it 'omits any word not in defined list' do
      jb = JungleBeat.new

      expect(jb.append('Mississippi')).to eq(0)
    end

    it 'returns the count of permissible words' do
      jb = JungleBeat.new
      
      expect(jb.append('doo dah Mississippi')).to eq(2)
    end
  end

  describe '#play' do
    it 'returns the numbers of sounds in a list' do
      jb = JungleBeat.new
      jb.append('deep doo ditt')
      jb.append('woo hoo shu')

      expect(jb.play)
    end

    it 'accepts changed rate and voice' do
      jb = JungleBeat.new('deep doo ditt woo hoo shu')
      jb.rate = 100
      jb.voice = 'Daniel'
      
      expect(jb.rate).to eq(100)
      expect(jb.voice).to eq('Daniel')
      expect(jb.play)
    end
  end

  describe 'prepend' do
    it 'prepends multiple sounds' do
      jb = JungleBeat.new
      jb.append('woo hoo shu')
      jb.prepend('deep doo ditt')

      expect(jb.all).to eq('deep doo ditt woo hoo shu')
    end

    it 'omits any word not in defined list' do
      jb = JungleBeat.new('deep')

      expect(jb.prepend('Mississippi')).to eq(0)
    end

    it 'returns the count of permissible words' do
      jb = JungleBeat.new
      
      expect(jb.prepend('doo dah Mississippi')).to eq(2)
    end
  end

  describe '#reset_rate' do
    it 'changes the rate back to 500' do
      jb = JungleBeat.new('deep dop dop deep')
      jb.rate = 100

      expect(jb.reset_rate).to eq(500)
    end
  end

  describe '#reset_voice' do
    it 'changes the voice back to Boing' do
      jb = JungleBeat.new('deep dop dop deep')
      jb.voice = 'Daniel'

      expect(jb.reset_voice).to eq('Boing')
    end
  end

  describe '#valid_beats' do
    it 'checks if the sound is in the list' do
      jb = JungleBeat.new

      expect(jb.valid_beat?('deep')).to eq('deep')
      expect(jb.valid_beat?('Mississippi')).to eq(nil)
    end
  end
end