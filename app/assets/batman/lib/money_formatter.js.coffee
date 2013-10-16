MONEY_FORMAT_REGEX = /(\{\{\s*(\w+)\s*\}\})/

Expensely.MoneyFormatter =

  isValid: (format) ->
    format.match(MONEY_FORMAT_REGEX)?

  format: (amount, format) ->
    return if not amount?
    isNegative = amount < 0
    amount = Math.abs(+amount)
    precision = 2

    matches = format.match(MONEY_FORMAT_REGEX)
    if matches && [match, rawFormat, chosenFormat] = matches
      formattedAmount = switch chosenFormat
        when 'amount_no_decimals'
          @formatWithDelimiters(amount, 0)
        when 'amount_with_comma_separator'
          @formatWithDelimiters(amount, precision, '.', ',')
        when 'amount_no_decimals_with_comma_separator'
          @formatWithDelimiters(amount, 0, '.', ',')
        when 'amount_no_decimals_with_space_separator'
          @formatWithDelimiters(amount, 0, ' ')
        else
          @formatWithDelimiters(amount, precision)

      formattedValue = format.replace(rawFormat, formattedAmount)
      if isNegative then '&#8722' + formattedValue else formattedValue

  formatWithDelimiters: (amount, precision = 2, thousands = ',', decimal = '.') ->
    parts = amount.toFixed(precision).split('.')
    parts[0] = parts[0].replace(/(\d)(?=(\d{3})+\b)/g, "$1#{thousands}")
    parts.join decimal
