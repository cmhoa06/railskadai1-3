class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            flash[:notice] = "新規登録しました"
            redirect_to :tasks
          else
            render :new
          end
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])

     if @task.update(task_params)
        flash[:notice] = "スケジュール情報を更新しました"
        redirect_to tasks_path
     else
        render :edit
     end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:notice] = "削除しました"
        redirect_to :tasks
    end

    def task_params
        params.require(:task).permit(
           :content,
           :start_at,
           :end_at,
           :is_all_day,
           :memo
        )
    end

end




