class Node
  attr_reader :sound, :next_node

  def initialize(sound)
    @sound = sound
    @next_node = nil
  end
end