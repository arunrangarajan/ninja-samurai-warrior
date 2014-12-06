class Expense < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :category, presence: true, length: { maximum: 15 }
  validates :value, presence: true
  validates_numericality_of :value, greater_than: 0, less_than: 500000, message: "Not within allowed range"
end
