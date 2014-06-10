require './card'
require 'pry'
class Game
  attr_accessor :value, :my_hand, :dealer_hand, :action
  def initialize
    @dealer_stack = 100
    @my_stack = 100
    puts "Welcome to blackjack. You have #{@my_stack} dollars"
    @my_hand = [Card.new.crank, Card.new.crank]
    @dealer_hand = [Card.new.crank, Card.new.crank]
    @value = value
    @action = action
  end

  def dvalue
    total = 0
    @dealer_hand.each do | x |
      total = x + total
    end
    total
  end

  def dealer_add
    if self.dvalue < 18
      @dealer_hand.push(Card.new.crank)
    end
  end

  def value
    total = 0
    @my_hand.each do | x |
      total = x + total
    end
    total
  end

  def ask
    print 'Would you like to hit or stand? '
    action = gets.chomp
    if action == 'hit'
      true
    else
      false
    end
  end

  def hit
    puts "Your hand has a value of #{self.value}"
    if ask == true
      @my_hand.push(Card.new.crank)
      puts "Your hand now has a value of #{self.value}"
    end
  end

  def new_hand
    @my_hand.clear
    @dealer_hand.clear
    2.times { @my_hand.push(Card.new.crank) }
    2.times { @dealer_hand.push(Card.new.crank) }
  end

  def stack
    if self.value > self.dvalue
      @my_stack + 10 && @dealer_stack - 10
      puts "You won the hand, you have #{@my_stack} dollars."
    elsif self.value == self.dvalue
      puts "You tied and got your bet back, you have #{@my_stack} dollars"
    elsif self.value < self.dvalue
      @my_stack - 10 && @dealer_stack + 10
      puts "You lost the hand, you have #{@my_stack} dollars"
    end
  end

  def bust?
    if self.value > 21
      true
    else
      false
    end
  end

  def dbust?
    if self.dvalue > 21
      true
    else
      false
    end
  end

  def bust
    if self.value > 21
      @my_stack -= 10
      'You busted'
    end
  end

  def dbust
    if self.dvalue > 21
      @dealer_stack - 10
      puts "The dealer busted with a hand value of #{self.dvalue}"
    end
  end

  def game_end
    if @my_stack < 0 || @dealer_stack < 0
      true
    else
      false
    end
  end
end
game = Game.new
until game.game_end == true
  game.new_hand
  game.hit
  until game.bust? == true || game.hit == false
    game.hit
    game.bust?
  end
  game.bust
  game.dbust
  game.dealer_add
  game.stack
  puts "

  "
end
