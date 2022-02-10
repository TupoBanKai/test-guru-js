class SessionsController < ApplicationController
  before_action :find_user, only: [ :create, :delete ]
  skip_before_action :authenticate_user!, only: [ :create, :new ]

  def new
    super
  end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to cookies[:url_for_reconnect_after_login] || root_path
    else
      flash[:alert] = '????'
      render :new
    end
  end

  def find_user
    @user = User.find_by(email: params[:email])
  end

end
