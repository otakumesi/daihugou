class Card
  include Comparable
  attr_accessor auit

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def solve(board)
    board.cards << self
    affect(board)
  end

  def affect(_)
    nil
  end

  def <=>(other)
    rank <=> other.rank if rank.between?(3..13) && other.rank.between?(3..13)
    rank <=> if rank.between?(1..2) && other.rank.between?(1..2)
  end

  def rank
    raise NoImplementsError
  end
end

class EightCard < Card
  def affect(board)
    board.cards = []
  end
end

class Jorker < Card
  def rank
    13
  end
end
