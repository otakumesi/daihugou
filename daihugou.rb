class Board
  attr_accessor :stack, :rule

  def initialize(effects, rule_class)
    @stack = []
    @rule = rule_class.new(self)
    @effects = effects
  end

  def put(*targets)
    raise GameError unless @rule.correct?(targets)
    cards = Cards.new(targets)
    board.stack << cards
    @effects.map { |effect| effect.apply(self) }
    top
  end

  def top
    @cards.last
  end
end

class GameError < StandardError; end
