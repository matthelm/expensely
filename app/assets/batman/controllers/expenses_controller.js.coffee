class Expensely.ExpensesController extends Expensely.ApplicationController
  routingKey: 'expenses'

  index: (params) ->
    @_newExpense()
    @set('categories', Expensely.Category.get('loaded'))
    Expensely.Expense.load (err, expenses) =>
      if err
        throw "Unable to load"
      else
        @set('expenses', Expensely.Expense.get('loaded'))

  createExpense: (node, event, context) ->
    @get('expense').save (err, expense) =>
      if err
        throw "Unable to create"
      else
        @_newExpense()

  _newExpense: ->
    today = new Date
    incurred_at = "#{today.getUTCFullYear()}-#{today.getUTCMonth() + 1}-#{today.getUTCDate()}"

    @set('expense', new Expensely.Expense(currency: 'CAD', incurred_at: incurred_at))
