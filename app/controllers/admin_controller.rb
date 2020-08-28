class AdminController < ApplicationController
  def top
    return redirect_to(login_path) unless session[:login].present?
    user = User.find(session[:login])

    if user.is_admin
      @users = User.eager_load(:tasks).all

      @task_count = {}
      @users.each do |user|
        @task_count[user.id] = user.tasks.to_a.count
      end
    else
      @message = "権限がありません"
    end
  end

  def new
    session[:error] = ""

    password = params[:password]
    password_confirm = params[:password_confirm]
    session[:error] = "パスワードが確認用と一致しません" if password != password_confirm

    check_nil(params[:password_confirm], "パスワード (確認用) ", "作成")
    check_nil(params[:password], "パスワード", "作成")
    check_nil(params[:name], "ユーザ名", "作成")


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
    user = User.eager_load(:tasks).find(params[:id])
    user.destroy

    redirect_to(admin_path)
  end

  def edit
    session[:error] = ""

    check_nil(params[:password], "パスワード", "編集")
    check_nil(params[:name], "ユーザ名", "編集")

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
  
  def user_tasks
    @tasks = Task.where(user_id: params[:id])
    @user_name = User.find(params[:id]).name
    if @tasks.count.zero?
      @message = "このユーザにはタスクがありません"
    end
  end

  private
    def check_nil(param, param_name, action_name)
      session[:error] = "[ユーザ#{action_name}時のエラー]#{param_name}を入力してください" if param.blank?
    end
end
