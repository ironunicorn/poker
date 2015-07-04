require_relative "hand"


class Player
  attr_accessor :pot, :hand, :folded, :current_bet

  def initialize(pot)
    @pot = pot
    reset
  end

  def get_bet
    puts "How much do you want to bet? (current pot: #{@pot})"
    gets.to_i
  end

  def place_bet(money)
    raise "not enough in pot" if money > pot
    @pot = pot - money
    @current_bet = current_bet + money
  end

  def fold_see_or_raise
    puts "fold, see, or raise? (f, s, r)"
    answer = gets.chomp.downcase
    until ["f", "s", "r"].include?(answer)
      puts "I don't understand. Fold, see, or raise? (f, s, r)"
      answer = gets.chomp.downcase
    end

    answer
  end

  def reset
    @folded = false
    @current_bet = 0
    @hand = Hand.new
  end

  def raise_bet
    puts "by how much? (current pot: #{@pot})"
    gets.to_i
  end

  def all_in
    puts "You don't have enough to match. Go all in? (y/n)"
    answer = gets.chomp.downcase
    place_bet(@pot) if answer == "y"
  end

  def discard_input
    print "Your hand: "
    @hand.display
    puts "which cards would you like to discard?"
    answer = gets.chomp.split(",").map(&:to_i)
    @hand.discard(answer)
  end
end
