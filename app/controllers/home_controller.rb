class HomeController < ApplicationController
  def top
    if User.count == 0 && Category.count == 0
      User.create(id: 1, name: 'user1', password: 'sample')
      Category.create(id: 1, title: 'categoryr1', user_id: 1)
    end

    if Task.count == 0
      Task.create(title: 'データ消えすぎ問題対策', deadline: Time.zone.now, priority: rand(0..2), state: rand(0..2), memo: 'test', user_id: 1, category_id: 1)
    end
    
    # 日付の場合、昇順→古い順　降順→新しい順
    @tasks = Task.order(created_at: :desc)
    # @tasks = Task.order(created_at: 'DESC')質問
  end

  def login
  end
end
