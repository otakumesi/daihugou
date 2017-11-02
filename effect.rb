class Effect
  def apply(_)
    raise NoImplementsError
  end
end

class YagiriEffect < Effect
  def apply(board)
    board.cards = [] if board.top.label == :eight
  end
end
