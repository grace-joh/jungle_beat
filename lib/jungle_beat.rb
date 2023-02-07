require './lib/linked_list'

class JungleBeat
  attr_reader :list, :count
  attr_accessor :rate, :voice

  def initialize(init_sounds = '')
    @list = LinkedList.new
    @count = @list.count
    @rate = 500
    @voice = 'Boing'
    append(init_sounds)
  end

  def all
    @list.to_string
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

  def play
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
  end

  def prepend(sounds)
    prepend_count = 0
    sounds.split(' ').reverse().each do |sound| 
      if valid_beat?(sound)
        @list.prepend(sound) 
        prepend_count += 1
      end
    end
    @count += prepend_count
    prepend_count
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = 'Boing'
  end

  def valid_beat?(sound)
    valid_sounds = ['tee', 'dee', 'deep', 'bop', 'boop', 'la', 'na', 'doo', 'ditt', 'woo', 'hoo', 'shu', 'doop', 'plop', 'suu', 'dop', 'shi', 'blop', 'dah']
    sound if valid_sounds.include?(sound)
  end
end