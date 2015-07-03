require_relative "hand"


class Player
  attr_accessor :pot

  def initialize(pot)
    @pot = pot
  end

  def place_bet(money)
    raise "not enough in pot" if money > pot
    @pot = pot - money
  end
end
