require './lib/linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
    @count = @list.count
  end

  def append(sounds)
    append_count = 0
    sounds.split(' ').each do |sound| 
      if valid_beat?(sound)
        @list.append(sound) 
        append_count += 1
      end
    end
    @count += append_count
    append_count   
  end

  def count
    @list.count
  end

  def play
    `say -r 500 -v Daniel #{@list.to_string}`
  end

  def valid_beat?(sound)
    valid_sounds = ["tee", "dee", "deep", "bop", "boop", "la", "na", "doo", "ditt", "woo", "hoo", "shu", "doop", "plop", "suu", "dop", "shi", "blop"]
    sound if valid_sounds.include?(sound)
  end
end