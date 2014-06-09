require './card'
class Deck
  def rank
    [1, 2, 3, 4, 5, 6, 7, 8, 9, :Jack, :Queen, :King, :Ace]
  end

  def suit
    [:Hearts, :Spades, :Clubs, :Diamonds]
  end
end
card = Card.new
dealer_deck = Deck.new.rank
puts "#{dealer_deck.delete(card.rank)}"
