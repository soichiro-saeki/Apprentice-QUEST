# frozen_string_literal:ture

def print_capitals(capital)
  capital.each do |key, value|
    puts "#{key}の首都は#{value}です"
  end
end

print_capitals({'日本' => '東京', 'アメリカ' => 'ワシントンD.C'})
