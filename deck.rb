require './card.rb'

class Deck
  def self.create
    cards = []
    Card::ORDERED_LABEL.tap { |l| l.first(l.size - 1) }.each do |label|
      label_cards = []
      %i[spade diamond heart club].each do |suit|
        label_cards << [suit, Card.new(label, suit)]
      end
      cards << [label, Hash[*label_cards.flatten]]
    end
    cards << [:joker, Card.new(:joker)]
    Hash[*cards.flatten]
  end
end
