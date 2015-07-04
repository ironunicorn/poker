class Hand
  attr_accessor :cards

  def self.return_winner(*hands)
    hands.sort.first
  end

  def <=>(other)
    #defines royal flushes


  end

  def flush?
    test_suit = cards.first.suit
    cards.all? { |card| card.suit == test_suit }
  end

  def straight
    cards.sort!
    i = 0
    while
  end



  def initialize
    @cards = []
  end

  def add_card(additional_card)
    raise "Don't be greedy" if cards.length >= 5
    cards << additional_card
  end

  def display
    @cards.each { |card| print card, " " }
  end

  def discard(array)
    raise "Which cards again?" if array.any? { |index| !index.between?(0, 4) }
    raise "Too many arguments" if array.length > 5
    array.each do |index|
      cards[index] = nil
    end
    cards.compact!
  end
end
