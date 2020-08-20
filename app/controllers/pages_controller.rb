class PagesController < ActionController::Base
  skip_before_action :verify_authenticity_token
    def home
      console
      @jobs = Job.all
    end

    def apply
      @name = params.dig(:name)
      @just = params.dig(:justifications)
      @code = params.dig(:code)
      @job_id = params.dig(:job_id)

      

      new_app_json = '{
       "name": @name,
       "justifications": @just,
       "code": @code,
       "job_id": @job_id 
      }'

      @app = Application.new(name: @name, justifications: @just, code: @code, job_id:  @job_id) 
      @app.save!
      
      
      redirect_to root_path
    end
end