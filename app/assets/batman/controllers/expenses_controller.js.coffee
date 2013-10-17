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

  show: (params) ->
    @set('categories', Expensely.Category.get('loaded'))
    Expensely.Expense.find params.id, (err, expense) =>
      if err
        throw "Unable to find"
      else
        @set('expense', expense)

  createExpense: (node, event, context) ->
    @get('expense').save (err, expense) =>
      if err
        throw "Unable to create"
      else
        @_newExpense()

  saveExpense: (node, event, context) ->
    @get('expense').save (err, expense) =>
      if err
        throw "Unable to save"
      else
        @redirect '/'

  deleteExpense: (node, event, context) ->
    context.get('expense').destroy (err, expense) =>
      if err
        throw "Unable to delete"

  _newExpense: ->
    today = new Date
    incurred_at = "#{today.getUTCFullYear()}-#{today.getUTCMonth() + 1}-#{today.getUTCDate()}"

    expense = new Expensely.Expense(currency: 'CAD', incurred_at: incurred_at)
    category = Expensely.Category.get('loaded.first')
    expense.set('category', category)
    @set('expense', expense)
