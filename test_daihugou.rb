require 'test/unit'
require './daihugou.rb'
require './deck.rb'
require './rule.rb'
require './effect.rb'

class TestBoard < Test::Unit::TestCase
  def setup
    @effects = [YagiriEffect.new]
    @board = Board.new(@effects, StandardPutableRule)
    @cards = Deck.create
  end

  def test_put_card
    @board.put(@cards[:three][:heart])
    @board.put(@cards[:four][:club])
    assert_equal(@board.cards.size, 2)
    assert_equal(@board.cards, [@cards[:three][:heart], @cards[:four][:club]])
  end

  def test_cant_put_smaller_number
    @board.put(@cards[:four][:diamond])
    assert_raise(GameError) do
      @board.put(@cards[:three][:spade])
    end
  end

  def test_eight_card_affect
    @board.put(@cards[:three][:heart])
    @board.put(@cards[:four][:club])
    @board.put(@cards[:eight][:diamond])
    assert_equal(@board.cards.size, 0)
    assert_equal(@board.cards, [])
  end

  def test_spade_three_card_rule
    @board.put(@cards[:joker])
    assert_nothing_raised GameError do
      @board.put(@cards[:three][:spade])
    end
  end
end
