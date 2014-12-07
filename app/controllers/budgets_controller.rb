class BudgetsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :update, :destroy]

	def new
		@budget = Budget.new
	end

	def create
		@budget = current_user.build_budget(budget_params)
		@budget.remaining = @budget.income
		@budget.used = 0
		if @budget.save
			flash[:success] = "Your budget has been set!"
			redirect_to root_path
		else
			render 'static_pages/home'
		end
	end

	def edit
		@budget = current_user.budget
	end

	def update
		@budget = current_user.budget
	    if @budget.update_attributes(budget_params)
  		  @budget.remaining = @budget.income - @budget.used
  		  @budget.update_attributes(budget_params)
	      flash[:success] = "Budget updated"
	      redirect_to current_user

	    else
      	render 'edit'
    	end
	end

	private

	def budget_params
		params.require(:budget).permit(:income, :remaining, :used)
	end
end
