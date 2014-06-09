require './card'
class Hand
  def initialize
    my_hand = [Card.new.crank, Card.new.crank]
    @my_hand = my_hand
    @value = value
  end

  def add_card
    @my_hand.push(Card.new.crank)
  end

  def bust?
    if @value > 21
      true
    else
      false
    end
  end

  def value
    value = 0
    @my_hand.each | @my_hand.rank |
    value += crank
    value
  end
end
bust = false
dbust = false
dealer_stack = 100
stack = 100
puts "Welcome to blackjack. You have #{stack} dollars"
until stack <= 0 || dealer_stack <= 0
  until bust == true || dbust == true
    my_hand = Hand.new
    dealer_hand = Hand.new
    bust = true if my_hand.value > 21
    dbust = true if dealer_hand.value > 21
    until @action.to_s == 'hit' || @action.to_s == 'stand'
      stack -= 10
      puts "The value of your hand is #{my_hand.value}"
      print 'Would you like to hit or stand: '
      @action = gets.chomp
    end
    if @action == 'hit' then my_hand.add_card
    end
    if dealer_hand <= 17 then dealer_hand.add_card
    end
    if my_hand.value > dealer_hand.value
      stack += 20 && dealer_stack -= 10
      puts "You won the hand, you have #{stack} dollars."
    elsif my_hand == dealer_hand.value
      puts 'You tied and got your bet back'
    else
      stack -= 10
      puts "You lost the hand, you have #{stack} dollars"
    end
  end
end
