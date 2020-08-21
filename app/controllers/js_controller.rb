class JsController < ApplicationController
  def ajax_create
    @title = params[:newTaskTitle]
    @message = ''

    @newTask = Task.create(
      title: @title,
      deadline: Time.zone.now + 1.day,
      priority: rand(0..2),
      state: rand(0..2),
      memo: 'test',
      user_id: session[:login],
      category_id: Category.where(user_id: session[:login]).first.id
    )
    if @newTask.valid?
      @id = @newTask.id
    else
      @message = @newTask.errors.full_messages
    end
    render
  end

  def ajax_before_edit
    @task_id = params[:id]
    render
  end

  def ajax_edit
    @message = ''

    @task = Task.find(params[:task_id])
    @task.title = params[:title]
    @task.deadline = params[:deadline]
    @task.priority = params[:priority]
    @task.state = params[:state]
    @task.memo = params[:memo]
    @task.save

    if !@task.valid?
      @message = @task.errors.full_messages
    end
    
    render
  end

  def ajax_delete
    @task_id = params[:task_id]
    @task = Task.find(@task_id)
    @task.destroy

    render
  end

end