require './lib/node'

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
    sounds = ""
    if @head != nil
      current_sound_node = @head
      sounds << current_sound_node.data
      until current_sound_node.next_node == nil
        current_sound_node = current_sound_node.next_node
        sounds << ' ' << current_sound_node.data
      end
    # else (list is empty and head is nil) output some error message?
    end
    sounds
  end

  def prepend(sound)
    prepend_node = Node.new(sound)
    prepend_node.next_node = @head
    @head = prepend_node
    @count += 1
    sound
  end

  def insert(insert_index, sound)
    if insert_index > @count
      if @count == 0
        "The list is empty."
      else
        "The insert position number is greater than the length of this list."
      end
    else
      current_node = @head 
      (insert_index - 1).times do 
        current_node = current_node.next_node
      end
      insert_node = Node.new(sound)
      insert_node.next_node = current_node.next_node
      current_node.next_node = insert_node
      @count += 1
      sound
    end
    
  end

  def find(find_index, num_to_return)
    if @count == 0
      "The list is empty! Please try again."
    elsif find_index > @count || find_index + num_to_return > @count
      "The list only has #{@count} sounds.. Please try again."
    else
      sounds_to_return = []
      find_node = @head
      find_index.times do
        find_node = find_node.next_node
      end
      num_to_return.times do
        sounds_to_return << find_node.data
        find_node = find_node.next_node
      end
      sounds_to_return.join(' ')
    end
  end

  def includes?(sound)
    current_node = @head
    included = false
    until current_node == nil
      break included = true if current_node.data == sound
      current_node = current_node.next_node
    end
    included
  end

  def pop
    current_node = @head
    if count == 0
      "The list is empty!"
    else
      pop_sound = @tail.data
      (count - 2).times do
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      @tail = current_node
      @count -= 1
      pop_sound
    end
  end
end
