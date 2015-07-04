require_relative 'player'
require_relative 'deck'

class PokerGame
  attr_accessor :players, :deck, :pot

  def initialize(num = 2)
    @players = Array.new(num) { Player.new(100) }
    @deck = Deck.new
    @pot = 0
  end

  def play

  end

  def play_turn
    deal
    get_and_place_first_bets
    until 

  end

  def get_and_place_first_bets
    @players.each do |player|
      bet = player.get_bet
      player.place_bet(bet)
      @pot += bet
    end
  end

  def deal
    5.times do
      players.each do |player|
        player.hand.add_card(deck.give_card)
      end
    end
  end

  def eliminate_players
    @players.reject! { |player| player.pot == 0 }
  end

  def over?
    @players.length == 1
  end
end
