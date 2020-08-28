class HomeController < ApplicationController
  def top
    
    return redirect_to(login_path) unless session[:login].present?

    if Category.where(user_id: session[:login]).count.zero?
      Category.create(title: "sample", user_id: session[:login])
    end

    user = User.find(session[:login])
    @sort_state = user.sort_state
    @is_admin = user.is_admin

    order = case @sort_state
              when 0 then
                {deadline: :desc}
              when 1 then
                {created_at: :desc}
              when 2 then
                {updated_at: :desc}
            end
    @tasks = Task.where(user_id: session[:login]).order(order)
  end

  def sort_tasks
    @user = User.find(session[:login])
    @user.sort_state = params[:sort_state]
    @user.save
  end
  

  def login
    redirect_to(root_path) if session[:login].present?
  end

  def auth
    id = params[:id]
    user = User.find_by(id: id)

    if user
      if user.authenticate(params[:password])
        session[:message] = ""
        session[:login] = id
        redirect_to(root_path)
      else
        session[:message] = "IDは見つかったが、パスワードが違う"
        redirect_to(login_path)
      end
    else
      session[:message] = "IDが見つからない"
      redirect_to(login_path)
    end
  end

  def logout
    session[:login] = nil
    redirect_to(login_path)
  end
  
end
