class HomeController < ApplicationController
  def top
    @tasks = Task.all
  end

  def login
  end

  def ajax_create
    @taskTitle = params[:taskTitle]

    @task = Task.new
    Task.create(title: @taskTitle, deadline: Time.zone.now, priority: 0, state: 0, memo: 'test', user_id: 1, category_id: 1)

    render
  end

  def ajax_edit
    @taskTitle = params[:taskTitle]
    @taskTitle = params[:taskTitle]
    @deadline = params[:deadline]
    @priority = params[:priority]
    @state = params[:state]
    @memo = params[:memo]

    @tasks = Task.all
    render
  end

end
