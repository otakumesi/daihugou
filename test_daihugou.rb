require 'test/unit'
require './daihugou.rb'

class TestBoard < Test::Unit::TestCase
  def setup
    @board = Board.new
    @three = ThreeCard.new
    @four = FourCard.new
    @five = FiveCard.new
    @six = SixCard.new
    @seven = SevenCard.new
    @eight = EightCard.new
    @nine = NineCard.new
    @ten = TenCard.new
    @jack = JackCard.new
    @queen = QueenCard.new
    @king = KingCard.new
    @one = OneCard.new
    @two = TwoCard.new
  end

  def test_put_card
    @board.put(@three)
    @board.put(@four)
    assert_equal(@board.cards.size, 2)
    assert_equal(@board.cards, [@three, @four])
  end

  def test_cant_put_smaller_number
    @board.put(@four)
    assert_raise(GameError) do
      @board.put(@three)
    end
  end

  def test_eight_card_affect
    @board.put(@three)
    @board.put(@four)
    @board.put(@eight)
    assert_equal(@board.cards.size, 0)
    assert_equal(@board.cards, [])
  end
end
