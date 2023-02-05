require './lib/linked_list'
require './lib/node'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(sounds)
    sounds.split(' ').each {|sound| @list.append(sound)}
  end

  def count
    @list.count
  end

  def play
    `say -r 500 -v Daniel #{@list.to_string}`
  end
end