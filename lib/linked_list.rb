class LinkedList
  attr_reader :head, :count, :current_node

  def initialize
    @head = nil
    @count = 0
    @current_node = nil
  end

  def append(sound)
    if count >= 1
      @current_node.next_node = Node.new(sound)
      @current_node = @current_node.next_node
    elsif count == 0
      @head = Node.new(sound)
      @current_node = @head
    end
    @count += 1
    sound
  end
end
