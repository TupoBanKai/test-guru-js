class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: [:show, :edit, :update, :destroy]
  before_action :find_user_badges, only: [:index]

  def index
    @badges = Badge.all
  end

  def show
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :pic_name, :sym_term)
  end

  def find_user_badges
    @user_badges = UserBadge.where(user_id: current_user.id)
  end

end
