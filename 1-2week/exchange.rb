# frozen_string_literal: true

def convert_currency(amount, source_currency, target_currency, conversion_rates)
  source_rate = conversion_rates[source_currency]
  target_rate = conversion_rates[target_currency]

amount * (target_rate/ source_rate)

end

conversion_rates = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8
}

puts convert_currency(100, :usd, :jpy, conversion_rates)
