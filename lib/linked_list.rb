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
    if @count > 0
      prepend_node = Node.new(sound)
      prepend_node.next_node = @head
      @head = prepend_node
    elsif @count == 0
      append(sound)
    end
    @count += 1
    sound
  end

  def insert(insert_num, sound)
    if @count == 0
      append(sound)
    elsif @count > 0
      if insert_num == 0
        prepend(sound)
      elsif insert_num == @count
        append(sound)
      elsif insert_num > @count
        append(sound)
        puts "The insert position number is greater than the length of this list."
        puts "Your new sound has been added to the end of the list."
      else
        insert_node = Node.new(sound)
        # traverse through list and set insert's next node to given position's node
        post_node = @head
        insert_num.times do
          post_node = post_node.next_node
        end
        insert_node.next_node = post_node

        # traverse through list to previous node and set it's next node to insert node
        pre_node = @head
        (insert_num - 1).times do
          pre_node = pre_node.next_node
        end
        pre_node.next_node = insert_node
        @count += 1
      end
    end
    sound
  end

  def find(find_num, num_to_return)
    if @count == 0
      "The list is empty! Please try again."
    elsif find_num > @count || find_num + num_to_return > @count
      "The list only has #{@count} sounds.. Please try again."
    else
      sounds_to_return = []
      find_node = @head
      find_num.times do
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
