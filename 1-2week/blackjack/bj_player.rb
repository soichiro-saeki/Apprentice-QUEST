# frozen_string_literal: true

require 'debug'
require_relative 'bj_deck'

# プレイヤークラス
class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def draw(deck)
    @hand += deck.draw(1)
  end

  debugger

  def open_hand
    @hand.each do |card|
      @hand << deck.draw(2)
      puts "あなたの引いたカードは#{hand}です"
    end
  end

  def draw_again(deck)
    while score < 21
      puts 'カードを引きますか?(y/n)'
      # プレイヤー1のみ入力を受け付ける
      answer = self == player1 ? gets.chomp : 'y'
      if answer.downcase == 'y'
        @hand += deck.draw(1)
        puts "あなたの引いたカードは#{@hand[-1]}です"
      else
        puts "あなたの得点は#{score}です"
      end
    end
  end

end

deck = Deck.new
player1 = Player.new
player1.draw(deck)
puts player1.draw_again(deck)

# player2 = Player.new
# player3 = Player.new
# dealer = Player.new
# player2 = Player.new
# player2.draw(deck)
# score = Score.new(player2)
# puts "Player2's score: #{score.calculate}"
# player3 = Player.new
# player3.draw(deck)
# score = Score.new(player3)
# puts "Player3's score: #{score.calculate}"

# [player1, player2, player3].each do |player|
#   player.draw(deck)
# end
