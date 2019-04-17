class Deck
    attr_reader :cards

    SUITS = [:hearts, :diamonds, :clubs, :spades]
    VALUES = (2..14).to_a

    def initialize
        @cards = []
        SUITS.each do |suit|
            VALUES.each do |value|
               @cards << Card.new(suit, value)
            end
        end
    end
end