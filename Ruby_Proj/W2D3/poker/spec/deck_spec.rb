require 'rspec'
require 'deck'

describe Deck do 
    subject(:deck) { Deck.new }
    describe "#initialize" do
        it "should set cards attribute to equal an array of cards" do
            expect(deck.cards.first).to be_instance_of(Card)
        end

        it "should contain 52 cards" do
            expect(deck.cards.length).to eq(52)
        end

        it "should contain 13 of each suit" do
            expect(deck.cards.count {|card| card.suit == :hearts}).to eq(13)
            expect(deck.cards.count {|card| card.suit == :diamonds}).to eq(13)
            expect(deck.cards.count {|card| card.suit == :clubs}).to eq(13)
            expect(deck.cards.count {|card| card.suit == :spades}).to eq(13)
        end

        it "should contain 4 of each value" do
            expect(deck.cards.count {|card| card.value == 2}).to eq(4)
            expect(deck.cards.count {|card| card.value == 3}).to eq(4)
            expect(deck.cards.count {|card| card.value == 4}).to eq(4)
            expect(deck.cards.count {|card| card.value == 5}).to eq(4)
            expect(deck.cards.count {|card| card.value == 6}).to eq(4)
            expect(deck.cards.count {|card| card.value == 7}).to eq(4)
            expect(deck.cards.count {|card| card.value == 8}).to eq(4)
            expect(deck.cards.count {|card| card.value == 9}).to eq(4)
            expect(deck.cards.count {|card| card.value == 10}).to eq(4)
            expect(deck.cards.count {|card| card.value == 11}).to eq(4)
            expect(deck.cards.count {|card| card.value == 12}).to eq(4)
            expect(deck.cards.count {|card| card.value == 13}).to eq(4)
            expect(deck.cards.count {|card| card.value == 14}).to eq(4)
        end
    end
end