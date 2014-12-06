require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user  = users(:arun)
  	@expense = Expense.new(name: "Qdoba Burrito", category: "Food", value: 7.00, user_id: @user.id)
  end

  test "should be valid" do
  	assert @expense.valid?
  end

  test "user id should be present" do
  	@expense.user_id = nil
  	assert_not @expense.valid?
  end

  test "name should be present" do
  	@expense.name = "   "
  	assert_not @expense.valid?
  end

  test "name should be no more than 50 characters" do
  	@expense.name = "a" * 51
  	assert_not @expense.valid?
  end

  test "category should be present" do
  	@expense.category = "   "
  	assert_not @expense.valid?
  end

  test "category should be no more than 15 characters" do
  	@expense.category = "a" * 16
  	assert_not @expense.valid?
  end

  test "value should be present" do
  	@expense.value = "   "
  	assert_not @expense.valid?
  end

  test "value should not be negative" do
  	@expense.value = -1.00
  	assert_not @expense.valid?
  end

  test "order should be most recent first" do
    assert_equal Expense.first, expenses(:most_recent)
  end
end
