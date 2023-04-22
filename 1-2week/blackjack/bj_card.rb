# frozen_string_literal: true

# 手札を表すクラス
class Card
  attr_reader :suit, :rank

  SUITS = %w[♠ ♥ ♦ ♣].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@suit}#{@rank}"
  end

  def score
    if @rank == 'A'
      11
      ace_value += 1
    elsif %w[J Q K].include?(@rank)
      10
    else
      @rank.to_i
    end
  end
end
