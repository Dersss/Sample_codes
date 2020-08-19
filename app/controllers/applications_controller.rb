class ApplicationsController < ApplicationController
  before_action :set_job
  before_action :set_job_application, only: [:show, :update, :destroy]

  # GET /jobs/:job_id/applications
  def index
    json_response(@job.applications)
  end

  # GET /jobs/:job_id/applications/:id
  def show
    json_response(@application)
  end

  # POST /jobs/:job_id/applications
  def create
    @job.applications.create!(application_params)
    json_response(@job, :created)
  end

  # PUT /jobs/:job_id/spplications/:id
  def update
    @application.update(application_params)
    head :no_content
  end

  # DELETE /jobs/:job_id/applications/:id
  def destroy
    @application.destroy
    head :no_content
  end

  private

  def application_params
    params.permit(:name, :job_id, :justifications, :code, :email, :description, :additional_links)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def set_job_application
    @application = @job.applications.find_by!(id: params[:id]) if @job
  end
end
