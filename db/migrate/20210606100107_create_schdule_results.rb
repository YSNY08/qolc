class CreateSchduleResults < ActiveRecord::Migration[6.1]
  def change
    create_table :schedule_results do |t|
      t.boolean :is_success
      t.integer :schedule_id, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
