class Budget < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :income, presence: true
  validates_numericality_of :income, greater_than: 0, less_than: 1000000, message: "Not within allowed range"
end
