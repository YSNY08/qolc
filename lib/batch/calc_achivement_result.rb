class Batch::CalcAchivementResult
  def execute
    User.includes(:schedules => :schedule_result).each do |user|
      weekly_achievement_rate = calc_weekly_achievement_rate(user)
      monthly_achievement_rate = calc_monthly_achievement_rate(user)
      totaly_achievement_rate = calc_totaly_achievement_rate(user)
      user.achievement_results.create(achievement_rate: weekly_achievement_rate, duration: 'weekly')
      user.achievement_results.create(achievement_rate: monthly_achievement_rate, duration: 'monthly')
      user.achievement_results.create(achievement_rate: totaly_achievement_rate, duration: 'totaly')
    end
  end

  private

  def calc_weekly_achievement_rate(user)
    one_week_ago = today - 7.days
    user_schedules = user.schedules.where('start > ?', one_week_ago.strftime('%F 00:00:00')).where('start < ?', today.strftime('%F 00:00:00'))
    calc_rate(user_schedules)
  end

  def calc_monthly_achievement_rate(user)
    one_month_ago = today - 31.days
    user_schedules = user.schedules.where('start > ?', one_month_ago.strftime('%F 00:00:00')).where('start < ?', today.strftime('%F 00:00:00'))
    calc_rate(user_schedules)
  end

  def calc_totaly_achievement_rate(user)
    user_schedules = user.schedules
    calc_rate(user_schedules)
  end

  def today
    Time.zone.today
  end

  def yesterday
    Time.zone.yesterday
  end

  def calc_rate(user_schedules)
    total_count = user_schedules.count
    achieved_count = 0
    user_schedules.each do |schedule|
      if schedule.schedule_result&.is_success
        achieved_count += 1
      end
    end
    return 0 if achieved_count.zero? || total_count.zero?

    (achieved_count.fdiv(total_count) * 100).to_i
  end
end
