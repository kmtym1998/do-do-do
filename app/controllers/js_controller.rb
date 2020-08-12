class JsController < ApplicationController
  def ajax_create
    @title = params[:newTaskTitle]
    @message = include FactoryBot::Syntax::Methods

    if(@title == '')
      @message = I18n.t('error.noTitle')
    else
      @task = Task.new
      @newTask = Task.create(title: @title, deadline: Time.zone.now, priority: rand(0..2), state: rand(0..2), memo: 'test', user_id: 1, category_id: 1)
      @id = @newTask.id
    end
    render
  end

  def ajax_before_edit
    @task_id = params[:id]
    # @task = Task.find_by(id: @task_id)
    

    render
  end

  def ajax_edit
    @title = params[:title]
    @task_id = params[:task_id]
    @deadline = params[:deadline]
    @priority = params[:priority]
    @state = params[:state]
    @memo = params[:memo]
    @message = ''

    if(@title == '')
      @message = I18n.t('error.noTitle')
    else
      @task = Task.find(@task_id)
      @task.title = @title
      @task.deadline = @deadline
      @task.priority = @priority
      @task.state = @state
      @task.memo = @memo
      @task.save
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