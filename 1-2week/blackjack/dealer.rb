# frozen_string_literal: true
require_relative 'bl_player'
require_relative 'bl_deck'
require_relative 'bl_card'


calss Dealer < Player
  def dealer_show
    puts "ディーラーの手札は#{@hand[0]}です"
    puts 'ディーラーの引いた2枚目のカードは分かりません'
  end

  def dealer_draw_again(deck)
    while score < 17
      @hand += deck.draw(1)
    end
  end

  def dealer_show_all
    @hand.each do |card|
    puts "ディーラーの手札は#{@hand}です"
  end


end
