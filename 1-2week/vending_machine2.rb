class VendingMachine
 def drink_list
  puts "sider:100円"
  puts "coke150円"
 end
 def press_button(drink)
  case drink
  when "coke"
    price = 150
  when "cider"
    price = 100
  end

  if @coin >= price
   puts "#{drink}を購入しますか？(はい/いいえ)"
   answer = gets.chomp
    if answer == "はい"
     @coin -= price
     puts "#{drink}"
    else
     "いいえ"
    end
  else
    "お金がたりません"
  end
  puts "残高#{@coin}"
 end
 def deposit_coin(coin)
  if coin == 100
   @coin += coin
  else
   "100円硬貨のみ受け付けます"
  end
end

 def initialize(manufacturer, coin)
  @manufacturer = manufacturer
  @coin = coin
 end

 private

 def press_manufacturer_name
  @manufacturer
 end
end

vending_machine = VendingMachine.new('サントリー', 200,)

puts vending_machine.drink_list
puts vending_machine.press_button("cider")



#vending_machine.deposit_coin(150)
#puts vending_machine.press_button

# vending_machine.deposit_coin(100)
# puts vending_machine.press_button
