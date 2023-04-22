# frozen_string_literal: true

require_relative 'bj_deck'
require_relative 'bj_card'

# プレイヤー1クラス
class Player1
  def initialize
    @hand = []
  end

  def draw(deck)
    @hand << deck.draw
  end
end

deck = Deck.new
player1 = player1.new
player1.draw(deck)
card = player1.draw(deck)
puts "あなたの引いたカードは#{card}です。"
puts "あなたの引いたカードは#{handcard[1]}です。"
