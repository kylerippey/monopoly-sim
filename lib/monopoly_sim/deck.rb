class MonopolySim::Deck
  attr_reader :cards

  def initialize(size=16)
    @cards = (0...size).to_a.shuffle
  end

  def draw!
    cards.rotate!
    cards.first
  end
end