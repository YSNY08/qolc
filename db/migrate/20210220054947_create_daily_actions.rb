class CreateDailyActions < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_actions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true
      t.references :daily_evaluate, null: false, foreign_key: true
      t.string :content
      t.float :value

      t.timestamps
    end
  end
end
