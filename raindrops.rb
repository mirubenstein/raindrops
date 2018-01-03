module NumericExtension
  refine Numeric do
    def factor_of?(other)
      (other % self).zero?
    end
  end
end


class RainSounds
  using NumericExtension
  class << self
    def for(number)
      ObjectSpace.each_object(Class).select { |klass| klass < self }.each_with_object([]) do |rain_sound, collection|
        collection << rain_sound.new(number) if rain_sound.to_s[-1].to_i.factor_of? number
      end
    end
  end

  attr_reader :number
  def initialize(number)
    @number = number
  end
end

class RainSound7 < RainSounds
  def to_s
    'Plong'
  end
end

class RainSound5 < RainSounds
  def to_s
    'Plang'
  end
end

class RainSound3 < RainSounds
  def to_s
    'Pling'
  end
end


class Raindrops
  def self.convert(number)
    rain_sounds = RainSounds.for(number).each_with_object('') do |rain_sound_class, string|
      string.concat(rain_sound_class.to_s)
    end
    rain_sounds.empty? ? number.to_s : rain_sounds
  end
end


module BookKeeping
  VERSION = 3
end
