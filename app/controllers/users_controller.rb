class UsersController < ApplicationController
  def signup
    @user=User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to :root
    else
      render :signup
    end
  end

  def create_login_session
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      #cookies.permanent[:auth_token] =user.auth_token //持久化保存
      cookies[:auth_token] = user.auth_token   #临时性保存 类似 session
      redirect_to :root
    else
      redirect_to :login
    end
  end
  def login

  end

  def logout
    cookies.delete(:auth_token)
    redirect_to :root
  end

  def avatar
    current_user.avatar=user_params[:pic]
    current_user.save!
    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit!
  end

end
