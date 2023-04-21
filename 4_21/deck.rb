require_relative 'Deck'
require_relative

#デッキクラス
class Deck
  def initialize
    @cards = []
    suits = %w[ハート スペード クローバー ダイヤ]
    nums = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    # suitと数字の組み合わせを作って配列に入れる
    suits.each do |suit|
      nums.each do |num|
        @cards << "#{suit}の#{num}"
      end
    end
    @cards.shuffle!
  end

  def draw(number)
    @cards.pop(number)
  end
end
