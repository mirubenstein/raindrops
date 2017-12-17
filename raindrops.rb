class Raindrops
  def self.convert(number)
    pling = 'Pling' if (number % 3).zero?
    plang = 'Plang' if (number % 5).zero?
    plong = 'Plong' if (number % 7).zero?
    sound = "#{pling}#{plang}#{plong}"
    if sound.empty?
      number.to_s
    else
      sound
    end
  end
end

module BookKeeping
  VERSION = 3
end
