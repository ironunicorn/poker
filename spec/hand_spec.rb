require 'hand'

describe Hand do
  attr_accessor :some_cards, :full_hand, :partial_hand

  before(:each) do
    card1 = double("card1", :value => "2", :suit => :spades)
    card2 = double("card2", :value => "3", :suit => :spades)
    card3 = double("card3", :value => "4", :suit => :diamonds)
    card4 = double("card4", :value => "2", :suit => :hearts)
    card5 = double("card5", :value => "10", :suit => :spades)

    @some_cards = [card1, card2, card3, card4, card5]
  end

  before(:each) do
    @full_hand = Hand.new
    @full_hand.cards = some_cards
    @partial_hand = Hand.new
    @partial_hand.cards = some_cards.drop(2)
  end

  describe '#initialize' do
    let(:new_hand) { Hand.new }
    it 'initializes with an empty hand' do
      expect(new_hand.cards).to eq([])
    end
  end

  describe '#add_card' do


    it 'doesn\'t accept more than five cards' do
      expect do
        full_hand.add_card("blerg")
      end.to raise_error
    end

    it 'adds a card to the hand' do
      partial_hand.add_card("string")
      expect(partial_hand.cards.length).to eq(4)
    end
  end

  describe '::compare_hands' do
    it "places a royal flush before a straight" do

    end
  end

  describe '#discard' do

    it "accepts an array of indices" do
      expect do
        full_hand.discard([1,2,3])
      end.to_not raise_error
    end

    it "raises an error for invalid indices" do
      expect do
        full_hand.discard([1,2,3,30])
      end.to raise_error
    end

    it "raises an error for more than five arguments" do
      expect do
        full_hand.discard([0,1,2,3,3,4])
      end.to raise_error
    end

    it "eliminates the specified cards" do
      expected = [some_cards[0], some_cards[3]]
      full_hand.discard([1,2,4])
      expect(full_hand.cards).to eq(expected)
    end
  end
end
