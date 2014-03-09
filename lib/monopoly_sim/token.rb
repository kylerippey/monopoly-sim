class MonopolySim::Token
  attr_reader :location

  def initialize(location=0)
    @location = location
  end

  def move(distance)
    @location += distance
    @location += 40 while @location < 0
    @location -= 40 while @location > 39
  end

  def go_to(location)
    @location = location if location >= 0 && location <= 39
  end

end