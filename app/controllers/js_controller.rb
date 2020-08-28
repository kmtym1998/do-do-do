class JsController < ApplicationController
  def ajax_create
    @message = ''
    if params[:newTaskTitle]
      @newTask = Task.create(
        title: params[:newTaskTitle],
        deadline: Time.zone.now + 1.day,
        priority: rand(0..2),
        state: rand(0..2),
        memo: 'test',
        user_id: session[:login],
        category_id: params[:category_id]
      )
      if @newTask.valid?
        @id = @newTask.id
        redirect_to("#{request.protocol}#{request.host}/category/#{params[:category_id]}")
      else
        @message = @newTask.errors.full_messages
      end
    elsif params[:newCategoryTitle]
      @newCategory = Category.create(
        title: params[:newCategoryTitle],
        user_id: session[:login]
      )
      unless @newCategory.valid?
        @message = @newTask.errors.full_messages
      end
      redirect_to(root_path)
    end
  end

  def ajax_before_edit
    @task_id = params[:id]
    render
  end

  def ajax_edit
    @message = ''

    if params[:task_id].present?
      @task = Task.find(params[:task_id])
      @task.title = params[:title]
      @task.deadline = params[:deadline]
      @task.priority = params[:priority]
      @task.state = params[:state]
      @task.memo = params[:memo]
      @task.save
      unless @task.valid?
        @message = @task.errors.full_messages
      end
    elsif params[:category_id].present?
      @category = Category.find(params[:category_id])
      @category.title = params[:category_title]
      @category.save
      unless @category.valid?
        @message = category.errors.full_messages
      end
    end
    

    
    render
  end

  def ajax_delete
    if params[:task_id].present?
      @id = params[:task_id]
      task = Task.find(@id)
      task.destroy
    elsif params[:category_id].present?
      @id = params[:category_id]
      category = Category.eager_load(:tasks).find(@id)
      category.destroy
      redirect_to(root_path)
    end
  end

end