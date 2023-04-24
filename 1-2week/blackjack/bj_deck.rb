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
  # n枚引くので引数はあえてnを指定する
  def draw(n)
    @cards.shift(n)
  end
end
