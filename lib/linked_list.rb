class LinkedList
  attr_reader :head, :count, :tail

  def initialize
    @head = nil
    @count = 0
    @tail = nil
  end

  def append(sound)
    if count > 0
      @tail.next_node = Node.new(sound)
      @tail = @tail.next_node
    elsif count == 0
      @head = Node.new(sound)
      @tail = @head
    end
    @count += 1
    sound
  end


  def to_string
    sounds = []
    if @head != nil
      current_sound_node = @head
      until current_sound_node == nil
        sounds << current_sound_node.data
        current_sound_node = current_sound_node.next_node
      end
    # else (list is empty and head is nil) output some error message?
    end
    sounds.join(' ')
  end

  def prepend(sound)
    if count > 0
      prepend_node = Node.new(sound)
      prepend_node.next_node = @head
      @head = prepend_node
    elsif count == 0
      append(sound)
    end
    sound
  end
end
