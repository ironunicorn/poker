require 'player'
require 'byebug'

describe Player do
  let(:player) { Player.new(100) }

  it "reponds to pot" do
    expect(player).to respond_to(:pot)
  end

  describe '#place_bet' do
    it "lowers the player's pot by the given amount" do
      player.place_bet(10)
      expect(player.pot).to eq(90)
    end

    it "doesn't allow the player to bet more than they've got" do
      expect do
        player.place_bet(110)
      end.to raise_error
    end
  end
end
