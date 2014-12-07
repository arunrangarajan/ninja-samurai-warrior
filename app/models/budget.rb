class Budget < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :income, presence: true
  validates_numericality_of :income, greater_than: 0, less_than: 1000000, message: "Not within allowed range"
  validates_numericality_of :used, greater_than_or_equal_to: 0, less_than: 1000000, message: "Not within allowed range"
  validates_numericality_of :remaining, greater_than: -500000, less_than: 1000000, message: "Not within allowed range"
end
