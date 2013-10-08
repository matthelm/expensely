class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :handle
      t.references :categories, index: true

      t.timestamps
    end
  end
end
