class Expensely.ExpensesController extends Expensely.ApplicationController
  routingKey: 'expenses'

  index: (params) ->
    console.log "expenses"
