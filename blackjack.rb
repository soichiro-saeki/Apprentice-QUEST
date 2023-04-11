#ゲームの実行（勝敗の確認）
class BlackJack
  def winner(player, dealer)
    if player.score > dealer.score
      puts "あなたの勝ちです！"
    elsif player.score < dealer.score
      puts "ディーラーの勝ちです。"
    else
      puts "引き分けです。"
    end
  end

  def play
    player = Player.new
    dealer = Dealer.new
    deck = Deck.new

    puts "ブラックジャックを開始します。"
    deck.shuffle
    player.firstdraw(deck)
    player.seconddraw(deck)




#ディーラーとplayerAにカードを2枚渡す（A,2,3,4,5,6,7,8,9,10,J,Q,Kをランダムに配布）
#プレイヤーのカードを2枚、ディーラーのカードを1枚表示する
#"あなたの引いたカードは"+"〇〇です"。
#"あなたの引いたカードは"+"〇〇です"。
#"ディーラーの引いたカードは"+"〇〇です"。
#あなたの現在の得点は〇〇点です。カードを引きますか？（Y/N:黄色）

#Y　あなたのひいたカードは〇〇です。
#あなたの現在の得点は〇〇点です。カードを引きますか？(Y/N)

#N
# ディーラーの引いた2枚目のカードは〇〇でした・
# ディーラーの現在の得点は〇〇です。
