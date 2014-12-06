class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.text :name
      t.text :category
      t.float :value
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :expenses, [:user_id, :created_at]
    add_index :expenses, [:user_id, :category]
    add_index :expenses, [:user_id, :value]
  end
end
