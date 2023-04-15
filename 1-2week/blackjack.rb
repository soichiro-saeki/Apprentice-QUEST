# frozen_string_literal: true

# ゲームクラス
class BlackJack
  # 書くclassで定義したインスタンス初期化
  def initialize
    deck = Deck.new
    player = Player.new(deck)
    player.open_hand
    dealer = Dealer.new(deck)
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
    else
      puts '引き分けです。'
    end
  end
end

# トランプの山札を準備してシャッフルするクラス
class Deck
  attr_reader :cards

  def initialize
    # 山札用の空配列
    @cards = []
    suit = %w[ハート スペード クローバー ダイヤ]
    num = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    # suitと数字の組み合わせを作って配列に入れる
    suit.each do |suit|
      num.each do |num|
        @cards << "#{suit}の#{num}"
      end
    end
    # 作った配列をシャッフルする
    @cards.shuffle!
  end

  # プレイヤーとディーラーがカードを引くと山札から削除する
  def draw(n)
    @cards.shift(n)
  end
end

# プレイヤークラス
class Player
  def initialize(deck)
    @hand = deck.draw(2)
    @ace_value = 11
  end
  # プレイヤーの引いたカードを表示する
  def open_hand
    puts "あなたの引いたカードは,#{@hand[0]}です。"
    puts "あなたの引いたカードは,#{@hand[1]}です。"
    show_score
  end

  def show_score
    puts "あなたのスコアは#{score}です。"
  end
  # スコアが21以下の場合にプレイヤーが再度引くかの選択をする

  def draw_again(deck)
    while score <= 21
      puts 'カードを引きますか?(y/n)'
      answer = gets.chomp

      if answer.downcase == 'y'
        @hand += deck.draw(1)
        puts "あなたの引いたカードは#{@hand[-1]}です。"
        show_score
      else
        return
      end
    end
  end

  def score
    Score.calculate(@hand)
  end
end

# ディーラークラス
class Dealer
  def initialize(deck)
    @hand = deck.draw(2)
  end

  def open_hand
    puts "ディーラーの引いたカードは#{@hand[0]}です。"
    puts 'ディーラーの引いた2枚目のカードはわかりません。'
  end

  def score
    Score.calculate(@hand)
  end

  def dealer_turn
    while
      dealer.score < 17
      dealer.draw(deck)
    end
  end

  def draw
    @hand += @deck.draw(1)
  end
end

class Score
  def self.calculate(hand)
    score = 0
    aces = 0
    hand.each do |card|
      if card.include?('A')
        aces += 1
        score += 11
      elsif card.include?('J') || card.include?('Q') || card.include?('K')
        score += 10
      else
        score += card.split('の')[1].to_i
      end
    end

    while score > 21 && aces > 0
      score -= 10
      aces -= 1
    end

    score
  end
end

puts 'ブラックジャックを始めます'
game = BlackJack.new
