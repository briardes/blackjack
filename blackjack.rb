require './card'
require 'pry'
class Hand
  attr_accessor :my_hand
  def initialize
    @my_hand = [Card.new.crank, Card.new.crank]
  end

  def value
    total = 0  # total is an integer
    @my_hand.each do | x | # totes is an array
      total = x + total # we want to increment the integer
    end
    total # and return the integer1
  end
end

class Game
  attr_accessor :value, :my_hand, :dealer_hand
  def initialize
    @dealer_stack = 100
    @my_stack = 100
    puts "Welcome to blackjack. You have #{@my_stack} dollars" ##
    @dbust = false
    @bust = false
    @my_hand = Hand.new
    @dealer_hand = Hand.new
  end

  def ask
    puts "Your hand has a value of #{@my_hand.value}."
    print 'Would you like to hit or stand? '
    action = gets.chomp
    if action == 'hit'
      true
    else
      false
    end
  end

  def hit
    if ask == true
      @my_hand.push(Card.new.crank)
    end
  end

  def new_hand
    @my_hand.clear
    @dealer_hand.clear
    2.times { @my_hand.push(Card.new.crank) }
    2.times { @dealer_hand.push(Card.new.crank) }
  end

  def stack
    if @my_hand.value > @dealer_hand.value ## undefined value
      @my_stack += 10 && @dealer_stack -= 10
      puts "You won the hand, you have #{stack} dollars."
    elsif @my_hand.value == @dealer_hand.value
      puts 'You tied and got your bet back'
    elsif @my_hand.value < @dealer_hand.value
      @my_stack -= 10 && @dealer_stack += 10
      puts "You lost the hand, you have #{@my_stack} dollars"
    end
  end

  def bust?
    if my_hand > 21
      true
    else
      false
    end
  end

  def dbust?
    if dealer_hand > 21
      true
    else
      false
    end
  end

  def game_end
    if stack == 0
      true
    else
      false
    end
  end
end

game = Game.new
until game.game_end == true
  game.ask
  game.hit
  puts "Your hand now has a value of #{@my_hand.value}"
  game.bust?
  game.dbust?
  game.stack
  game.new_hand
end
