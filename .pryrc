begin
  require 'pp'
  require './daihugou.rb'
  require './card.rb'
  require './deck.rb'
  @board = Board.new
  @cards = Deck.create
rescue LoadError => _
  puts 'failed to require.. :('
end
