require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize(cards = Card.all_cards)
    @cards = cards
    shuffle!
  end

  def length
    cards.length
  end

  def give_card
    cards.shift
  end

  def receive_card(card)
    cards << card
  end

  def shuffle!
    cards.shuffle!
  end
end
