# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = [
  "Transportation (Airfare, car rentals, parking & mileage)",
  "Accommodations (Hotel rooms)",
  "Meals & Entertainment",
  "Misc. Travel Expenses",
  "Professional Development (Conference & course fees)",
  "Recruitment Costs",
  "Cellphones & Wireless",
  "Software & Licenses",
  "Computer Hardware",
  "Computer Supplies (Peripherals & add-ons)",
]

categories.each do |c|
  Category.create(title: c)
end

category_id = Category.first.id

expenses = [
  {
    total_amount: 65,
    total_cad: 65,
    total_tax: 3.5,
    currency: 'CAD',
    incurred_at: '2013-09-10',
    description: 'Taxi to airport',
    category_id: category_id
  },
  {
    total_amount: 125.32,
    total_cad: 52,
    total_tax: 15.2,
    currency: 'CAD',
    incurred_at: '2013-09-12',
    description: 'Dinner for recruiting',
    category_id: category_id
  },
  {
    total_amount: 52,
    total_cad: 52,
    total_tax: 4.1,
    currency: 'USD',
    incurred_at: '2013-10-02',
    description: 'Mike\'s D3 Book',
    category_id: category_id
  }
]

expenses.each do |e|
  Expense.create(e)
end
