#自動販売機　QUEST

class VendingMachine
 def press_button
  if
    @coin >= 100
    @coin -= 100
      "cider"
  else
    "お金がたりません"
  end
 end

#  def choice(drink,coin)
#   if
#     @drink = drink
#     @coin >= 100
#     choice_drink = gets.chomp
#     "ciderを買いますか？"
#   else if
#     @drink = drink
#     @coin >= 150
#     "ciderとcorkどちらを買いますか？"
#     choice_drink = gets.chomp
#   else
#     @coin < 100
#     "お金がたりません"
#   end

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

vending_machine = VendingMachine.new('サントリー', 90)
puts vending_machine.press_button

#vending_machine.deposit_coin(150)
#puts vending_machine.press_button

# vending_machine.deposit_coin(100)
# puts vending_machine.press_button
