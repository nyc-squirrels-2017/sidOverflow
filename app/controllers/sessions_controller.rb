class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def login
    @user = User.find_by_username(session_params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to questions_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

  private

  def session_params
    params.permit(:username, :password)
  end

end
