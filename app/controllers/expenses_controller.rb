class ExpensesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def create
		@expense = current_user.expenses.build(expense_params)
		@budget = current_user.budget
		if @expense.save
			flash[:success] = "Expense added!"
			redirect_to root_url
			@budget.remaining = @budget.remaining - @expense.value
			@budget.used = @budget.used + @expense.value
			@budget.save 
		else
			@feed_items = []
			render 'static_pages/home'
		end	
	end

	def destroy
		@budget = current_user.budget
	    @budget.used = @budget.used - @expense.value
	    @budget.remaining = @budget.remaining + @expense.value
	    @expense.destroy
	    @budget.save
	    flash[:success] = "Expense deleted"
	    redirect_to request.referrer || root_url
	end

	private
		def expense_params
			params.require(:expense).permit(:name, :category, :value)
		end

		def correct_user
	      	@expense = current_user.expenses.find_by(id: params[:id])
	      	redirect_to root_url if @expense.nil?
      	end
end
