class Expensely.Expense extends Batman.Model
  @resourceName: 'expense'
  @storageKey: 'expenses'

  # Persist
  @persist Batman.RailsStorage

  # Encode
  @encode 'total_amount', 'total_cad', 'total_tax', 'currency', 'description', 'incurred_at'

  # Association
  @belongsTo 'category'
