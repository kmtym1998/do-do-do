class HomeController < ApplicationController
  def top
    # 日付の場合、昇順→古い順　降順→新しい順
    @tasks = Task.order(created_at: :desc)
    # @tasks = Task.order(created_at: 'DESC')質問
  end

  def login
  end
end
