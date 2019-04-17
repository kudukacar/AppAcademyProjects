require 'rspec'
require 'card'

describe Card do
    subject(:card) { Card.new(:hearts, 10) }

    describe "#initialize" do
        it "creates a card" do
            expect(card).to be_instance_of(Card)
        end

        it "initializes the card with a suit" do
            expect(card.suit).to eq(:hearts)
        end

        it "initializes the card with a value" do
            expect(card.value).to eq(10)
        end
    end

end