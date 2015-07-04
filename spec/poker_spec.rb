require 'poker'

describe PokerGame do
  let(:new_game) { PokerGame.new }
  
  describe "#initialize" do
    it "defaults to two players" do
      expect(new_game.players.length).to eq(2)
    end

    it "takes in an argument for number of players" do
      expect do
        PokerGame.new(3)
      end.to_not raise_error
    end

  end

  describe "#play" do
    it "alternates between players"
  end
end
