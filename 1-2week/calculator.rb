def calculate(num1, num2, operator)
  # クラスを完成させてください
  case operator
  when '+'
    result = num1 + num2
  when '-'
    result = num1 - num2
  when '*'
    result = num1 * num2
  when '/'
    result = num1 / num2
  else
    puts '演算子には  +、-、*、/ のいずれかを使用してください'
  end
  result
end

puts "1番目の整数を入力してください:"
num1 = gets.chomp.to_f

puts "2番目の整数を入力してください:"
num2 = gets.chomp.to_f

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
rescue ZeroDivisionError
 puts "0で除算することはできません"
end

calculate(1, 0, '/')
calculate(1.5, 2, '+')
calculate(1.5, 2, '**')
calculate(5, 2, '*')
