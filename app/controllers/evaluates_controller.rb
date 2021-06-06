class EvaluatesController < ApplicationController
  before_action :prepare_current_user, only: %i[index]

  def index
    @weekly_achievement_rate = @user.achievement_results.where(duration: 'weekly').last&.achievement_rate
    @monthly_achievement_rate = @user.achievement_results.where(duration: 'monthly').last&.achievement_rate
    @totaly_achievement_rate = @user.achievement_results.where(duration: 'totaly').last&.achievement_rate
  end
end
