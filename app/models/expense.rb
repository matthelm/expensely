class Expense < ActiveRecord::Base
  belongs_to :category

  validates_inclusion_of :currency, in: %w( CAD USD )
  validates_associated :category

end
