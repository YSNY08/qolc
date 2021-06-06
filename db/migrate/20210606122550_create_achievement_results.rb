class CreateAchievementResults < ActiveRecord::Migration[6.1]
  def change
    create_table :achievement_results do |t|
      t.string :duration
      t.integer :user_id, null: false, foreign_key: true
      t.integer :achievement_rate

      t.timestamps
    end
  end
end
