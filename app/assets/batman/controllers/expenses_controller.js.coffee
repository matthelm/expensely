class Expensely.ExpensesController extends Expensely.ApplicationController
  routingKey: 'expenses'

  index: (params) ->
    Expensely.Expense.load (err, expenses) =>
      if err
        throw "Unable to load"
      else
        @set('expenses', Expensely.Expense.get('loaded'))
