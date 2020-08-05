class JsController < ApplicationController
  def ajax_create
    @taskTitle = params[:taskTitle]

    @task = Task.new
    @newTask = Task.create(title: @taskTitle, deadline: Time.zone.now, priority: rand(0..2), state: rand(0..2), memo: 'test', user_id: 1, category_id: 1)
    
    render
  end

  def ajax_before_edit
    @task_id = params[:id]
    # @task = Task.find_by(id: @task_id)
    

    render
  end

  def ajax_edit
    @task_id = params[:task_id]
    @title = params[:title]
    @deadline = params[:deadline]
    @priority = params[:priority]
    @state = params[:state]
    @memo = params[:memo]

    @task = Task.find(id: @task_id)
    @task.title = @title
    @task.deadline = @deadline
    @task.priority = @priority
    @task.state = @state
    @task.memo = @memo
    @task.save
    
    render
  end

  def ajax_delete
    @task_id = params[:task_id]
    @task = Task.find(id: @task_id)
    @task.destroy

    render
  end

end