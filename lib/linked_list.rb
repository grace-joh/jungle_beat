class LinkedList
  attr_reader :head, :count, :current_node

  def initialize
    @head = nil
    @count = 0
    @current_node = nil
  end

  def append(sound)
    if count > 0
      @current_node.next_node = Node.new(sound)
      @current_node = @current_node.next_node
    elsif count == 0
      @head = Node.new(sound)
      @current_node = @head
    end
    @count += 1
    sound
  end


  def to_string
    sounds = []
    if @head != nil
      sounds << @head.data
      current_sound_node = @head.next_node
      until current_sound_node == nil
        sounds << current_sound_node.data
        current_sound_node = current_sound_node.next_node
      end
    # else (list is empty and head is nil) output some error message?
    end
    sounds.join(' ')
  end
end
