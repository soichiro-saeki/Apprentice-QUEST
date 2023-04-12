#自動販売機　QUEST

class VendingMachine

 def deposit_coin(yen)
  @yen = yen
 end

 def press_manufacturer_name
  @manufacturer
 end
 def press_button
  "cider"
 end

 private

 def initialize(manufacturer = nil)
  #引数不足によってエラーになる？→
  @manufacturer = manufacturer
 end

end


vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_manufacturer_name

vending_machine.deposit_coin(150)
puts vending_machine.press_button

vending_machine.deposit_coin(100)
puts vending_machine.press_button

vending_machine = VendingMachine.new
puts vending_machine.press_button
