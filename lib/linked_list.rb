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
end
