#ゲームの実行（勝敗の確認）

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    case rank
    when :A
      1
    when 2,3,4,5,6,7,8,9,10
      rank
    when :J, :Q, :K
      10
    end
  end
end

class Deck
  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:"スペード", :"ダイヤ", :"ハート", :"クローバー"]

  def initialize
    @cards = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }
  end

  def draw(n)
    @cards.sample(n)
  end
end

deck = Deck.new
cards = deck.draw(2)
total = cards.sum{|card| card.value}

class Player
  attr_reader :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def draw(deck)
    @cards += deck.draw(2)
  end

  def total
    @cards.sum(&:value)
  end


  def show_cards
    puts "#{name}'s Cards: #{cards.map { |card| "#{card.rank} of #{card.suit}" }.join(', ')}"
    puts "#{name}'s Total: #{total}"
  end




deck = Deck.new
player1 = Player.new("Alice")
player2 = Player.new("Bob")

[player1, player2].each do |player|
  player.draw(deck)
  player.show_cards
end

[player1, player2].each do |player|
  player.hit_or_stand(deck)
end

end
