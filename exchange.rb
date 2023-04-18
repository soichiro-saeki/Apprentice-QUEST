# frozen_string_literal: true

def conversion_rate(amount, source_currency, target_currence, conversion_rate)
  conversion_rate = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8
}

amount *source_currency/target_currence

end


puts convert_currency(100, :usd, :jpy, conversion_rates)
