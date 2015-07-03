require 'card'

describe Card do
  let(:some_card) { Card.new("Q", :hearts) }

  describe "#initialize" do
    it 'initializes with a value' do
      expect(card.value).to eq("Q")
    end

    it 'initializes with a suit' do
      expect(card.suit).to eq(:hearts)
    end

    context "when given bad a value" do
      it "throws an error" do
        expect do
          Card.new("bogus value", :spades)
        end.to raise_error
      end
    end

    context "when given bad a suit" do
      it "throws an error" do
        expect do
          Card.new("10", :noodles)
        end.to raise_error
      end
    end
  end

  describe '#to_s' do
    it "interpolates the value of the suit" do
      expect(card.to_s).to eq("Q ♥".colorize(:red))
    end
  end
end
