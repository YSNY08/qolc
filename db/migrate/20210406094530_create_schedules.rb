class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :body
      t.boolean :disp_flg
      t.datetime :start
      t.datetime :end
      t.datetime :allDay

      t.timestamps
    end
  end
end
