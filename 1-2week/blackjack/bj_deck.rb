# frozen_string_literal: true

require_relative 'bj_card'

# デッキクラス
class Deck
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end

  def cards
    @cards.shuffle!
  end

  # デッキからカードをn枚引いてデッキから削除する
  def draw
    @cards.shift(n)
  end
end
