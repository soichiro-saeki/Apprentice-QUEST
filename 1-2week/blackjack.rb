# frozen_string_literal: true

# ゲームクラス
class BlackJack
  def initialize
    deck = Deck.new
    player = Player.new(deck)
    player.open_hand
    dealer = Dealer.new(deck)
    dealer.open_hand
  end
end
#   def winner(player, dealer)
#     if player.score > dealer.score
#       puts 'あなたの勝ちです!'
#     elsif player.score == dealer.score
#       puts '引き分けです'
#     else player.score < dealer.score
#       puts 'ディーラーの勝ちです'
#     end
#   end
#   def play
#     player = Player.new
#     dealer = Dealer.new
#     desk = Desk.new

# トランプの山札を準備してシャッフルするクラス
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    suit = ['ハート','スペード','クローバー','ダイヤ']
    num = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    suit.each do |suit|
      num.each do |num|
        @cards << "#{suit}の#{num}"
      end
    end
    @cards.shuffle!
  end

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
  end
  # 引いたカードがAの場合に1か11かを選択する
  def choose_ace_value(value)
    # valueの値を変数として1もしくは11として扱う
    if value == 1 || value == 11
      @ace_value = value
      puts "Aの値を#{value}にします。"
    else
      puts "Aの値を1か11どちらにしますか？"
    end
  end

  def score
    score = 0
    @hand.each do |card|
      if card.include?('A')
        score += @ace_value
      elsif card.include?('J') || card.include?('Q') ||card.include?('K')
      elsif
        score += card.split('の')[1].to_i
      end
    end
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
    score = 0
    @hand.each do |card|
      if card.include?('A')
        score += 11
      elsif card.include?('j') || card.include?('Q') || card.include?('K')
        score += 10
      else
        score += card.split('の')[1].to_i
      end
  end
  score
  end
end

class
end
puts 'ブラックジャックを始めます'
game = BlackJack.new
