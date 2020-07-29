class HomeController < ApplicationController
  def top
    @tasks = Task.all
  end

  def login
  end
end
