class LinkedList
  attr_reader :head

  def initialize
    @head = nil
    @count = 0
  end

  def append(sound)
    if @head == nil
      @head = Node.new(sound)
      @count += 1
    end
  end
end