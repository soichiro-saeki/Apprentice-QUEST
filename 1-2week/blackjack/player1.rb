# frozen_string_literal: true

require_relative 'bj_deck'
require_relative 'bj_card'

# プレイヤー1クラス
class Player1
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def draw(deck)
    @hand << deck.draw(1)
  end

  def draw_agein(deck)
  when @hand.sum < 17
    @hand << deck.draw(1)
    
end

deck = Deck.new
player1 = player1.new
player1.draw(deck)
hand = player1.draw(deck)
puts "あなたの引いたカードは#{@hand[0]}です。"
puts "あなたの引いたカードは#{@hand[1]}です。"
