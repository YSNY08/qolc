class SchedulesController < ApplicationController
  before_action :require_user_logged_in

  def index
    @schedule = Schedule.new
  end

  def show
    @user = User.find(session[:user_id])
    @date = params[:date].to_date
    @prev_date = @date - 1.days
    @next_date = @date + 1.days

    # 対象ユーザのある1日のスケジュールを全て取得
    user_daily_schedules = Schedule
                             .where(user_id: @user.id)
                             .where('start >= ?', @date.strftime("%F 00:00:00"))
                             .where('start < ?', @date.strftime("%F 24:00:00"))
    # 空の配列を用意
    @schedules = []
    # 複数あるスケジュールを1時間刻みで仕分ける
    (0..23).each do |t|
      # 開始時間tの条件に当てはまるスケジュールを変数target_schedulesに格納する
      target_schedules = user_daily_schedules
                           .where('start >= ?', @date.strftime("%F #{sprintf("%02d", t)}:00:00"))
                           .where('start < ?', @date.strftime("%F #{sprintf("%02d", t + 1)}:00:00"))
      # target_schedulesと@schedulesの同じ開始時間にそれぞれスケジュールをpushする
      @schedules.push({ start: "#{sprintf("%02d", t)}:00",
                        end: "#{sprintf("%02d", t + 1)}:00",
                        schedules: target_schedules})
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @date = params[:date]
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    redirect_to schedule_path
  end

  def update
    binding.pry
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    redirect_to schedule_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedule_path
  end

  private
# スケジュール新規作成時 ActionController::ParameterMissing (param is missing or the value is empty: schedule):エラーになる
  def schedule_params
    params.require(:schedule).permit(:title, :start, :end, :body, :user_id)
  end
end
