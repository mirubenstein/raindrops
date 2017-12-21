class RainSounds
  class << self
    def for(number) # TODO still order dependant. What should know what to concat? Another class needed?
      ObjectSpace.each_object(Class).select { |klass| klass < self }.each_with_object([]) do |rain_sound, collection|
        collection << rain_sound.new(number) if rain_sound.factor_of number
      end.each_with_object('') do |rain_sound_class, string|
        string.concat(rain_sound_class.to_s)
      end
    end
  end

  attr_reader :number
  def initialize(number)
    @number = number
  end
end

class RainSound7 < RainSounds
  def self.factor_of(number)
    (number % 7).zero?
  end

  def to_s
    'Plong'
  end
end

class RainSound5 < RainSounds
  def self.factor_of(number)
    (number % 5).zero?
  end

  def to_s
    'Plang'
  end
end

class RainSound3 < RainSounds
  def self.factor_of(number)
    (number % 3).zero?
  end

  def to_s
    'Pling'
  end
end

class RainSoundBase < RainSounds
  def self.factor_of(number)
    @number = number
    !(number % 3).zero? && !(number % 5).zero? && !(number % 7).zero?
  end

  def to_s
    @number.to_s
  end
end


class Raindrops
  def self.convert(number)
    RainSounds.for number
  end
end


module BookKeeping
  VERSION = 3
end
