class HomeController < ApplicationController
  def top
    @tasks = Task.all.order(created_at: 'DESC')
  end

  def login
  end
end
