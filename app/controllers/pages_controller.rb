class PagesController < ActionController::Base
    def home
      console
      @jobs = Job.all
    end

    def apply
      @name = params[:name]
      @just = params[:just]
      @code = params[:code]
      @job_id = params[@job_id]
      Application.create(name: @name, justifications: @just, code: @code, job_id:  @job_id)
    end
end