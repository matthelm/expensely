class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :total_amount, :currency, :total_cad, :total_tax, :incurred_at, :description
  has_one :category
end

class ExpensesController < ApplicationController

  def index
    render json: Expense.all.includes(:category), root: 'expenses'
  end

  def show
    render json: Expense.find(params[:id])
  end

  def create
    expense = Expense.create(expense_params)
    if expense.new_record?
      render json: { errors: expense.errors.messages }, status: 422
    else
      render json: expense, status: 201
    end
  end

  def update
    expense = Expense.find(params[:id])

    if expense.update(expense_params)
      render json: expense, status: 200
    else
      render json: { errors: expense.errors.messages }, status: 422
    end
  end


  def destroy
    expense = Expense.find(params[:id])
    expense.destroy

    render json: nil, status: 200
  end

  private

  # Strong Parameters (Rails 4)
  def expense_params
    params.require(:expense).permit(:total_amount, :currency, :total_cad, :total_tax, :incurred_at, :description, :category_id)
  end

end
