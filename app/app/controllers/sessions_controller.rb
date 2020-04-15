class SessionsController < ApplicationController
  
  def login
    user = User.find_by(email: params[:login]).authenticate(params[:password])
    if user
      session[:current_user_id] = user.id

      flash[:success] = "You have successfully logined!"
      redirect_to task_url  
    else
      flash[:alert] = "Wrong login or password"
      redirect_to login_url
    end
  end

  def logout
    session.clear
    redirect_to login_url
  end

  def show_login_page
    render 'sessions/login_page'
  end

  def signup
  end
end
