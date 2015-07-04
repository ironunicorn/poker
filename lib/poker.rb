require_relative 'player'
require_relative 'deck'

class PokerGame
  attr_accessor :players, :deck, :pot, :highest_bet

  def initialize(num = 2)
    @players = Array.new(num) { Player.new(100) }
    @deck = Deck.new
    @pot = 0
    @highest_bet = 0
  end

  def play
    until over?
      play_turn
    end
    puts "Congrats! Go home."
  end

  def play_turn
    deal
    get_and_place_first_bets
    players.each do |player|
      discards = player.discard_input
      fill_hand(player)
    end

    until round_over?
      players.each do |player|
        next if player.folded || player.pot == 0
        puts "You must match: #{highest_bet}."
        input = player.fold_see_or_raise

        if input == "f"
          player.folded = true
        elsif input == "s"
          amount = highest_bet - player.current_bet
          @pot += amount
          player.place_bet(amount)
          player.see = true
        else
          amount = player.raise_bet
          @pot += amount
          reset_see(player)
        end
      end
    end

    winner = calculate_winner
    winner.pot += @pot
    @pot = 0
    @highest_bet = 0
    eliminate_players
  end

  def calculate_winner
    potential_winners = players.reject { |player| player.folded }
    hands = potential_winners.map(&:hand)
    best_hand = Hand.return_winner(*hands)
    potential_winners.select { |w| w.hand == best_hand }.first
  end

  def deal
    players.each do |player|
      fill_hand(player)
    end
  end

  def fill_hand(player)
    player.hand.add_card(deck.give_card) until player.hand.length == 5
  end

  def get_and_place_first_bets
    @players.each do |player|
      bet = player.get_bet
      player.place_bet(bet)
      @pot += bet
      @highest_bet = bet if bet > highest_bet
    end
  end

  def round_over?
    @players.all? do |player|
      player.folded || player.pot == 0 || !player.see
    end
  end

  def reset_see(raise_player)
    players.each { |player| player.see = false }
    raise_player.see = true
  end

  def eliminate_players
    @players.reject! { |player| player.pot == 0 }
  end

  def over?
    @players.length == 1
  end
end
