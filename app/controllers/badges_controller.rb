class BadgesController < ApplicationController
  before_action :find_user, only: [:index]
  before_action :find_user_badges, only: [:index]

  def index
    @badges = Badge.all
  end

  def show
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :pic_name)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def find_user_badges
    @user_badges = UserBadge.where(user_id: current_user.id)
  end

end
