class Rule
  def initialize(board)
    @board = board
  end

  def correct?
    raise NoImplementsError
  end

  protected

  attr_reader :board
end

module SpadeThreePutable
  def correct_level?(card)
    return true if applicable?(card)
    super(card)
  end

  private

  def applicable?(card)
    top_card_joker? && spade_three_card?(card)
  end

  def top_card_joker?
    top_card_single? && @board.top.first.label == :joker
  end

  def spade_three_card?(cards)
    cards.first.label == :three && cards.first.suit == :spade if cards.one?
  end
end

class PutableRule < Rule
  def gamestart?
    board.top.nil?
  end

  def top_card_single?
    board.top.one?
  end

  def top_card_multi?
    !top_card_single?
  end
end

class StandardPutableRule < PutableRule
  prepend SpadeThreePutable

  def correct?(cards)
    gamestart? || correct_level?(cards)
  end

  def correct_level?(cards)
    # if top_card_single?
    # end
    # 
    # if top_card_multi?
    # end

    board.top.first < compare_card
  end
end

# class ReversePutableRule < PutableRule
#   prepend SpadeThreePutable
# 
#   def correct?
#     gamestart? || level?
#   end
# 
#   def correct_level?(card)
#     board.top > card
#   end
# end
