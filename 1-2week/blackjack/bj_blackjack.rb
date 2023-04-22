# frozen_string_literal: true

require_relative 'player'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'

# ゲームクラス
class PlayGame
  def initialize
    deck = Deck.new
    hand = Hand.new(Player)
    player1 = player.new(player1)
    player2 = player.new(player2)
    player3 = player.new(player3)
    dealer = player.new(dealer)
    game = Game.new
  end
end
