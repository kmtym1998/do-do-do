class HomeController < ApplicationController
  def top
    if User.count == 0 && Category.count == 0
      User.create(id: 1, name: 'user1', password: 'sample')
      Category.create(id: 1, title: 'categoryr1', user_id: 1)
    end

    if Task.count == 0
      Task.create(title: 'データ消えすぎ問題対策', deadline: Time.zone.now, priority: rand(0..2), state: rand(0..2), memo: 'test', user_id: 1, category_id: 1)
    end
    
    @tasks = Task.order(created_at: :desc)
  end

  def login
  end
end
