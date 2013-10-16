Batman.Filters.money = (amount) ->
  amount = 0 unless amount
  Expensely.MoneyFormatter.format(amount, "${{amount}}")
