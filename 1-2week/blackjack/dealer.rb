# frozen_string_literal: true

require_relative 'bl_player'
require_relative 'bl_deck'
require_relative 'bl_card'

# ディーラークラス
class Dealer

  def initialize
    @hand = []
  end

  def open_hand
    @hand = deck.draw(2)
      puts "ディーラーの引いたカードは#{hand[0]}です"
      puts "ディーラーが引いた2枚目のカードは分かりません。"
  end

  def draw_again(deck)
    while score < 17 ; hand += deck.draw(1)
    end
  end

  def dealer_show
    answer = self == player1 ? gets.chomp : 'y'
    if answer
    puts "ディーラーの引いたカードは#{hand[1]}でした。"
  end

  def dealer_show_all
    @hand.each do |hand|
      puts "ディーラーの手札は#{@hand}です"
    end
  end
end
