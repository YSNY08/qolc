class Schedule < ApplicationRecord
  belongs_to :user
  has_one :schedule_result
end
