class CreateDailyEvaluates < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_evaluates do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
