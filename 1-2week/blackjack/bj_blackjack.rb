# frozen_string_literal: true

require_relative 'player'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'

# ゲームクラス
class PlayGame
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @score = Score.new
    
  end
end
