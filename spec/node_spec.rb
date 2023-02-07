require 'rspec'
require './lib/node'

RSpec.describe Node do
  describe '#initialize' do
    it 'exists' do
      node = Node.new('first')

      expect(node).to be_an_instance_of(Node)
    end

    it 'has a sound' do
      node = Node.new('first')

      expect(node.data).to eq('first')
    end

    it 'has a next_node' do
      node = Node.new('first')

      expect(node.next_node).to eq(nil)
    end
  end
end