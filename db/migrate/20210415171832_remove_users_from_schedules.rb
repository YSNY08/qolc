class RemoveUsersFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :users, :integer
  end
end
