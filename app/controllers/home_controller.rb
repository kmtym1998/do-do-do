class HomeController < ApplicationController
  def top
    if User.count == 0 && Category.count == 0
      User.create(id: 1, name: 'user1', password: 'sample', sort_state: 0)
      Category.create(id: 1, title: 'categoryr1', user_id: 1)
    end

    if Task.count == 0
      Task.create(title: 'データ消えすぎ問題対策', deadline: Time.zone.now, priority: rand(0..2), state: rand(0..2), memo: 'test', user_id: 1, category_id: 1)
    end

    @sort_state = User.first.sort_state

    case @sort_state
    when 0
      @tasks = Task.order(deadline: :desc)
    when 1
      @tasks = Task.order(created_at: :desc)
    when 2
      @tasks = Task.order(updated_at: :desc)
    else
    end
  end

  def sort_tasks
    @user = User.first
    @user.sort_state = params[:sort_state]
    @user.save
  end
  

  def login
  end
end
