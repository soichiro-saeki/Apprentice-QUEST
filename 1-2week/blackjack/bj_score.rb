# frozen_string_literal: true
require 'debug'
require_relative 'bj_player'


# スコアクラス
class Score
  def initialize(player)
    @player = player
  end

  def calculate
    score = 0
    @player.hand.each do |card|
      score += card_value(card, score)
    end
    score
  end

  def card_value(card, score)
    if card.rank == 'A'
      ace_value(score)
    elsif card.rank.to_i.zero?
      10
    else
      card.rank.to_i
    end
  end

  def ace_value(score)
    if score + 11 <= 21
      11
    else
      1
    end
  end
end
