class DailyAction < ApplicationRecord
  belongs_to :user
  belongs_to :daily_evaluate
end
