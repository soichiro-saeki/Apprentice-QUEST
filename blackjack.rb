# ゲームプレイ
# プレイ前の事前準備　山札からカード2枚引く→手札公開→得点の計算
def play_game
  deck = Deck.new
  deck = shuffle
  player = Player.new
  player.first_draw(deck)
  player.score_count
  dealer = Dealer.new
  dealer.first_draw(deck)
end

# プレイヤーターン追加でカードを引くか引かないかの選択


# 引いたときには21よりちいさ
