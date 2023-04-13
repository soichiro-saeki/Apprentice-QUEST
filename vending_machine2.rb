class VendingMachine
 def press_button
  if @coin >= 100
   puts "ciderを購入しますか？(はい/いいえ)"
   answer = gets.chomp
    if answer == "はい"
     @coin -= 100
     "cider"
    else
     "いいえ"
    end
  else
    "お金がたりません"
  end
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

vending_machine = VendingMachine.new('サントリー', 100)
puts vending_machine.press_button

#vending_machine.deposit_coin(150)
#puts vending_machine.press_button

# vending_machine.deposit_coin(100)
# puts vending_machine.press_button
