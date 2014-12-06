class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.float :income
      t.references :user, index: true

      t.timestamps
    end
    add_index :budgets, [:user_id, :created_at]
  end
end
