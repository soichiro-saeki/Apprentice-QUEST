# frozen_string_literal: true

def train_fare(age)
  return unless 0 <= age && age <= 150

    if age >= 12
      puts 200
    elsif 6 <= age && age <12
      puts 100
    else
      puts 0
    end
end

train_fare(12)
