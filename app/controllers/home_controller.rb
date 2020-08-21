class HomeController < ApplicationController
  def top
    redirect_to(login_path) if !session[:login]

    if Category.where(user_id: session[:login]).count == 0
      Category.create(title: "sample", user_id: session[:login])
    end

    @sort_state = User.find(session[:login]).sort_state

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
