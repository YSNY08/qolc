# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(id: 1,
            name: "test",
            email: "test1@example.com",
            password: "password")
today_six_am = Time.zone.today.strftime('%F 06:00:00').to_datetime
(1..100).each do |t|
  Schedule.create(user_id: 1,
                 title: 'test',
                 body: 'test',
                 start: today_six_am - 1.days + (t * 30).minute,  # 今日から1週間前の朝6時から30分刻み
                 end: today_six_am - 1.days + (t * 30).minute + 1.hour) # startから1時間後
end
