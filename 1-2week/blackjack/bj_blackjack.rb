# frozen_string_literal: true

require_relative 'player'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'

# ゲームクラス
class PlayGame
class BlackJack
  # 書くclassで定義したインスタンス初期化
  def initialize
    deck = Deck.new
    player = Player.new
    player.open_hand
    dealer = Dealer.new
    dealer.open_hand
    player.draw_again(deck)
    winner(player, dealer)
  end

  # プレイヤーとディーラーの勝敗のメソッド
  def winner(player, dealer)
    if player.score > 21
      puts 'あなたはバストしました。ディーラーの勝ちです。'
    elsif dealer.score > 21
      puts 'ディーラーはバストしました。あなたの勝ちです。'
    elsif player.score > dealer.score
      puts 'あなたの勝ちです。'
    elsif player.score < dealer.score
      puts 'ディーラーの勝ちです。'
    elsif player.score == 21
      puts 'ブラックジャック!あなたの勝ちです'
    else
      puts '引き分けです。'
    end
  end
end

end
