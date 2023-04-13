# frozen_string_literal: true

# 自動販売機クラス
class VendingMachine
  def drink_list
    puts 'sider:100円'
    puts 'coke:150円'
  end

  def press_button(drink)
     @drink = drink
     case drink
     when 'coke'
       price = 150
     when 'cider'
       price = 100
   end

  if @coin >= price
    puts "#{@drink}を購入しますか？(はい/いいえ)"
    answer = gets.chomp
      if answer == "はい"
        puts "どの商品を購入しますか？（sider/coke）"
        selected_drink = gets.chomp
          case selected_drink
          when answer == "sider"
            puts "sider"
          when answer == "coke"
            puts "お金がたりません"
          end
        @coin -= price
        puts "#{@drink}"
      else
      "いいえ"
      end
      else
       puts "お金がたりません"
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

vending_machine = VendingMachine.new('サントリー', 100)

puts vending_machine.drink_list
