class Card
  attr_reader :value, :suit
  SUITS = {
    hearts: "♥",
    spades: "♠",
    clubs: "♣",
    diamonds: "♦"
  }
  VALUES = (2..10).to_a.map(&:to_s) + ["J", "Q", "K", "A"]

  def self.all_cards
    SUITS.keys.each_with_object([]) do |suit, cards|
      VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end
  end

  def initialize(value, suit)
    raise "invalid card" unless VALUES.include?(value)
    raise "invalid suit" unless SUITS.keys.include?(suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{value} #{SUITS[suit]}"
  end

  def <=>(other_card)
    VALUES.index(@value) <=> VALUES.index(other_card.value)
  end

end
