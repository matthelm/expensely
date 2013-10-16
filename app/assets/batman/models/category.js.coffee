class Expensely.Category extends Batman.Model
  @resourceName: 'category'
  @storageKey: 'categories'

  # Persist
  @persist Batman.RailsStorage

  # Encode
  @encode 'title'

  # Association
  @hasMany 'expenses'

  # Mixin
  @classMixin Expensely.ModelLoader
