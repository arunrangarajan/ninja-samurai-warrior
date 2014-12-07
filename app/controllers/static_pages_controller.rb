class StaticPagesController < ApplicationController
  def home
    if logged_in? && user_good?
    	@expense = current_user.expenses.build
    	@feed_items = current_user.feed.paginate(page: params[:page])
    elsif logged_in?
      redirect_to new_budget_path
    end
  end

  def help
  end

  def about
  end 

  def contact
  end
  
end
