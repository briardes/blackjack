require 'minitest/autorun'
require './blackjack'
require './card'

class CardTest < MiniTest::Unit::TestCase
  def test_that_user_recieves_2_cards_on_round_beginning
    assert_equal Hand.new.size, 2
  end

  def test_that_face_cards_are_dead
    card = Card.new
    card.rank = :King
    assert_equal card.rank.crank, 10
  end

  def test_that_hit_gives_user_new_card
    assert_equal Hand.new.add_card.size, 3
  end
end
