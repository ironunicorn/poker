class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(additional_card)
    raise "Don't be greedy" if cards.length >= 5
    cards << additional_card
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
