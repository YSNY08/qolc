class ScheduleResultsController < ApplicationController
  def index
    user_id = params[:user_id]
    yesterday = Time.zone.yesterday
    user = User.find(user_id)
    @target_schedules = user.schedules.where('start >= ?', yesterday.strftime("%F 00:00:00")).where('start < ?', yesterday.strftime("%F 24:00:00"))
    if @target_schedules.any? { |ts| ts.schedule_result.present? }
      redirect_to root_path
    else
      @schedule_result = ScheduleResult.new
    end
  end

  def create
    values = params[:results].values
    results = values.each_with_object([]) do |val, result|
      result << ScheduleResult.new(schedule_id: val['schedule_id'],
                                   is_success: val['is_success'],
                                   date: Time.zone.yesterday)
    end
    ScheduleResult.import results
    redirect_to root_path
  end
end
