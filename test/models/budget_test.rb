require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:arun)
  	@budget = @user.build_budget(income: 12345.12, remaining: 12345.12, used: 0)
  end

  test "should be valid" do
  	assert @budget.valid?
  end

  test "user id should be present" do
  	@budget.user_id = nil
  	assert_not @budget.valid?
  end

  test "income should be present" do
    @budget.income = "  "
    assert_not @budget.valid?
  end

  test "income should not be greater than 999999" do
    @budget.income = 1000000
    assert_not @budget.valid?
  end

  test "income should not be below 0" do
    @budget.income = -1
    assert_not @budget.valid?
  end

end
