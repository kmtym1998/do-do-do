class AdminController < ApplicationController
  def top
    redirect_to(login_path) if !session[:login]
    user = User.find(session[:login])

    if user.is_admin
      @users = User.all
    else
      @message = "権限がありません"
    end
  end
  
end
