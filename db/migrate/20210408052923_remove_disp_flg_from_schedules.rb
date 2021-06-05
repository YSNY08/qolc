class RemoveDispFlgFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :disp_flg, :boolean
  end
end
