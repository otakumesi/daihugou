class Card
  include Comparable
  attr_accessor :suit, :label

  ORDERED_LABEL = %i[
    three
    four
    five
    six
    seven
    eight
    nine
    ten
    jack
    queen
    king
    one
    two
    joker
  ].freeze

  def initialize(label, suit = nil)
    @label = label
    @suit = suit
  end

  def level
    ORDERED_LABEL.index(@label)
  end

  def <=>(other)
    level <=> other.level
  end
end

class Cards
  include Enumerable
  include Comparable

  def each
    yield @cards
  end

  def initialize(cards)
    @cards = cards
  end

  def single?
    @cards.one?
  end

  def multi?
    !single?
  end

  def <=>(other)
    cards <=> other.cards
  end

  protected

  attr_accessor :cards
end
