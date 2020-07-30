class JsController < ApplicationController
  def ajax_create
    @taskTitle = params[:taskTitle]

    @task = Task.new
    @newTask = Task.create(title: @taskTitle, deadline: Time.zone.now, priority: rand(0..2), state: rand(0..2), memo: 'test', user_id: 1, category_id: 1)

    render
  end

  def ajax_before_edit
    @task_id = params[:id]
    @task = Task.find_by(id: 53)
    

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