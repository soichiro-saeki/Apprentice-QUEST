class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['Hearts', 'Diamonds', 'Spades', 'Clubs'].each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      ['Jack', 'Queen', 'King', 'Ace'].each do |face|
        @cards << Card.new(suit, face)
      end
    end
    @cards.shuffle!
  end

  def deal
    cards.pop
  end
end

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def value
    value = 0
    aces = 0
    cards.each do |card|
      if card.value == 'Ace'
        aces += 1
        value += 11
      elsif card.value.to_i == 0 # J, Q, K
        value += 10
      else
        value += card.value.to_i
      end
    end

    # correct for Aces
    while value > 21 && aces > 0
      value -= 10
      aces -= 1
    end

    value
  end

  def busted?
    value > 21
  end

  def blackjack?
    value == 21 && cards.size == 2
  end

end

class Player < Hand
end

class Dealer < Hand
end


deck = Deck.new

player1 = Player.new
player2 = Player.new
player3 = Player.new

dealer = Dealer.new

[player1, player2, player3, dealer].each do |player|
 player.add_card(deck.deal)
 player.add_card(deck.deal)
end


puts "Player1: #{player1.cards.map(&:to_s).join(', ')}. Total: #{player1.value}"
puts "Player2: #{player2.cards.map(&:to_s).join(', ')}. Total: #{player2.value}"
puts "Player3: #{player3.cards.map(&:to_s).join(', ')}. Total: #{player3.value}"
puts "Dealer: #{dealer.cards.map(&:to_s).join(', ')}. Total: #{dealer.value}"

loop do
 break if player1.busted? || player1.blackjack?
 puts "Player1, would you like to hit or stay? (h/s)"
 answer = gets.chomp.downcase
 if answer == 'h'
   player1.add_card(deck.deal)
   puts "Player1: #{player1.cards.map(&:to_s).join(', ')}. Total: #{player1.value}"
 else
   break
 end
end

if player1.busted?
 puts "Player1 busted. Dealer wins."
else
 [player2, player3].each do |player|
   loop do
     break if player.busted? || player.blackjack?
     if player.value <17
       player.add_card(deck.deal)
       puts "#{player.class}: #{player.cards.map(&:to_s).join(', ')}. Total: #{player.value}"
     else
       break
     end
   end
   if player.busted?
     puts "#{player.class} busted."
   end
 end

 loop do
   break if dealer.busted? || dealer.blackjack?
   if dealer.value <17
     dealer.add_card(deck.deal)
     puts "Dealer: #{dealer.cards.map(&:to_s).join(', ')}. Total: #{dealer.value}"
   else
     break
   end
 end

 if dealer.busted?
   puts "Dealer busted. Player wins."
 else
   if dealer.value > player1.value && dealer.value > player2.value && dealer.value > player3.value
     puts "Dealer wins."
   elsif dealer.value < player1.value || dealer.value < player2.value || dealer.value < player3.value
