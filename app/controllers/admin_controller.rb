class AdminController < ApplicationController
  def top
    redirect_to(login_path) if !session[:login]
    user = User.find(session[:login])

    if user.is_admin
      @users = User.all

      @task_count = {};
      @users.each do |user|
        @task_count[user.id] = Task.where(user_id: user.id).count
      end 
    else
      @message = "権限がありません"
    end
  end

  def new
    session[:error] = ""
    def check_nil(param, param_name)
      if param.blank?
        session[:error] = "[ユーザ追加時のエラー]#{param_name}を入力してください"
      end
    end

    password = params[:password]
    password_confirm = params[:password_confirm]
    session[:error] = "パスワードが確認用と一致しません" if password != password_confirm

    check_nil(params[:password_confirm], "パスワード (確認用) ")
    check_nil(params[:password], "パスワード")
    check_nil(params[:name], "ユーザ名")


    if session[:error].blank?
      User.create({
        password: password,
        name: params[:name],
        is_admin: false,
        sort_state: 0
      })
    end
    redirect_to(admin_path)
  end
  


  def delete
    user = User.find(params[:id])
    user.destroy

    redirect_to(admin_path)
  end

  def edit
    session[:error] = ""    
    def check_nil(param, param_name)
      if param.blank?
        session[:error] = "[ユーザ編集時のエラー]#{param_name}を入力してください"
      end
    end

    check_nil(params[:password], "パスワード")
    check_nil(params[:name], "ユーザ名")

    user = User.find(params[:id])

    session[:error] = "パスワードが違います" if !user.authenticate(params[:password])

    if session[:error].blank?
      user.name = params[:name]
      user.is_admin = params[:is_admin]
      user.password = params[:password]
      user.save!
    end
    redirect_to(admin_path)
  end
  
  
  
end
