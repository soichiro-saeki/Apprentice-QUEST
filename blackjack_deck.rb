#トランプのデッキ作成
suits = ["ハート", "ダイヤ", "クラブ", "スペード"]
ranks = ["エース", 2, 3, 4, 5, 6, 7, 8, 9, 10, "ジャック", "クイーン", "キング"]

deck = suits.product(ranks)

cards = deck.sample(2)
cards.each do |card|
  puts "#{card[1]} の #{card[0]}"
end

total = cards.map do |card|
  if ["ジャック", "クイーン", "キング"].include?(card[1])
    10
  elsif card[1].is_a?(Integer)
    card[1]
  else
    0
  end
end.sum
puts "合計点数: #{total}"
