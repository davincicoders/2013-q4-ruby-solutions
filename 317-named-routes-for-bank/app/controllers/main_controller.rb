class MainController < ApplicationController

  def root
    redirect_to login_path and return
  end

  def login
    render :login and return
  end

  def login_post
    username = params["username"]
    password = params["password"]

    found_user = User.find_by(username: username)

    if found_user == nil
      flash.now[:error] = "Incorrect username"
      render :login and return
    elsif found_user.authenticate(password) == false
      flash.now[:error] = "Incorrect password"
      render :login and return
    else
      session[:user_id] = found_user.id
      redirect_to accounts_path and return
    end
  end

  def accounts
    @user = User.find_by(id: session[:user_id])
    render :accounts and return
  end

  def location
    @user = User.find_by(id: session[:user_id])
    render :location and return
  end

  def rates
    @user = User.find_by(id: session[:user_id])
    render :rates and return
  end

  def logout
    session.clear
    redirect_to login_path and return
  end

end
