class Card
  attr_accessor :crank, :rank
  def initialize
    @rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace].sample
  end

  def rank
    @rank
  end

  def rank=(new_rank)
    @rank=new_rank
  end

  def crank
    if @rank == :Jack
      10
    elsif @rank == :Queen
      10
    elsif @rank == :King
      10
    elsif @rank == :Ace
      11
    else
      @rank
    end
  end
end
