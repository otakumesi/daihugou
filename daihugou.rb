require './card.rb'

class Board
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def put(card)
    raise GameError if !top.nil? && top > card
    card.solve(self)
  end

  def top
    @cards.first
  end
end

class GameError < StandardError; end
