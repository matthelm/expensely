Expensely.ModelLoader =
  setup: (data) ->
    loaded = @get('loaded')
    for object in data
      loaded.add(@createFromJSON(object))
