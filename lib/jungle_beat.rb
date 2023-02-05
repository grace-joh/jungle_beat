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
end