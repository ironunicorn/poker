require 'deck'

describe Deck do
  let(:default_deck) { Deck.new }

  describe '#initialize' do

    it "accepts an array of cards as argument"

    it "should create 52 cards by default" do
      expect(default_deck.length).to eq(52)
    end

    it "shouldn't have duplicates" do
      expect(default_deck.cards.uniq).to eq(default_deck.cards)
    end
  end

  describe '#give_card' do
    it "removes one card" do
      len = default_deck.length
      default_deck.give_card
      expect(default_deck.length).to eq(len - 1)
    end
  end

  describe '#receive_card' do
    it "adds one card" do
      len = default_deck.length
      default_deck.receive_card("a card")
      expect(default_deck.length).to eq(len + 1)
    end
  end
end
