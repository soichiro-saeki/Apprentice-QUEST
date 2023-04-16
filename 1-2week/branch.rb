# frozen_string_literal: true

def greater(x, y)
  if x >= -100 && y <= 100
    if x < y
      puts 'x < y'
    elsif x == y
      puts 'x == y'
    else
      puts 'x > y'
    end
  end
end

greater(10, 10)
