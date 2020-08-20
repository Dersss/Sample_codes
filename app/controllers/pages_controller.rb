class PagesController < ActionController::Base
    def home
      console
      @jobs = Job.all
    end

    def apply
      @name = params[:name]
      @just = params[:just]
      @code = params[:code]
      @job_id = params[:job_id]
      app = Application.create(name: @name, justifications: @just, code: @code, job_id:  @job_id)
      redirect_to root_path
    end
end