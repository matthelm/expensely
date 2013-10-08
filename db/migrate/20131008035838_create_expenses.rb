class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :total_amount
      t.string :currency
      t.decimal :total_cad
      t.decimal :total_tax
      t.references :category, index: true
      t.date :incurred_at
      t.text :description

      t.timestamps
    end
  end
end
