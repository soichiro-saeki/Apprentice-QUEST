#ゲームを実行するクラス
class Game
  def initialize
    @deck = Deck.new
    @player = Player.new
  end

  def Play
    puts 'ポーカーを開始します'
    @player.draw(@deck)
    puts "あなたの引いたカードは#{@player.cards[0].to_s}です。"
    puts "あなたの引いたカードは#{@player.cards[1].to_s}です。"
  end
end
