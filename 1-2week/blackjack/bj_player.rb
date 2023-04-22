# frozen_string_literal: true

require_relative 'bj_deck'
require_relative 'bj_card'
require_relative 'bj_score'

# プレイヤークラス
class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def draw(deck)
    @hand += deck.draw(2)
  end

  def open_hand
    @hand.each do |hand|
      puts "あなたの引いたカードは#{hand}です"
    end
  end

  private

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
score = Score.new(player1)
puts "Player1's score: #{score.calculate}"

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
