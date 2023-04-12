class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    case rank
    when 'Ace'
      1
    when 'King', 'Queen', 'Jack'
      10
    else
      rank.to_i
    end
  end

  def to_s
    "#{suit} of #{rank}"
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    suits = ['ハート', 'ダイヤ', 'クラブ', 'スペード']
    ranks = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

  def draw
    cards.shift
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add(card)
    cards << card
  end

  def value
    total = cards.map(&:value).reduce(:+)
    # Handle the case where Aces should be counted as a value of 1 instead of a value of 11.
    cards.select { |card| card.rank == 'Ace' }.count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def to_s
    cards.join(', ')
  end
end

class Game
  attr_reader :deck, :player_hand, :dealer_hand

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    deal_initial_cards!
  end

  def play_round!
    puts "Player's hand: #{player_hand} (#{player_hand.value})"
    puts "Dealer's hand: #{dealer_hand.cards.first} and an unknown card"

    while player_hand.value < 21 && hit?
      player_hand.add(deck.draw)
      puts "Player's hand: #{player_hand} (#{player_hand.value})"
    end

    if player_hand.value > 21
      puts "Player busts! Dealer wins."
      return
    end

    while dealer_hand.value <17
      dealer_hand.add(deck.draw)
      puts "Dealer's hand: #{dealer_hand} (#{dealer_hand.value})"
    end

     if dealer_hand.value >21
       puts "Dealer busts! Player wins."
       return
     elsif dealer_hand.value == player_hand.value
       puts "It's a tie!"
     elsif dealer_hand.value > player_hand.value
       puts "Dealer wins!"
     else
       puts "Player wins!"
     end

     puts "Player's hand: #{player_hand} (#{player_hand.value})"
     puts "Dealer's hand: #{dealer_hand} (#{dealer_hand.value})"

   end

   private

   def deal_initial_cards!
     player_hand.add(deck.draw)
     player_hand.add(deck.draw)
     dealer_hand.add(deck.draw)
     dealer_hand.add(deck.draw)
   end

   def hit?
     loop do
       print "Do you want to hit or stand? (h/s) "
       answer = gets.chomp.downcase
       return true if answer.start_with?('h')
       return false if answer.start_with?('s')
       puts "Invalid input. Please enter h or s."
     end
   end
end

game = Game.new
game.play_round!
