class JobsController < ApplicationController
    before_action :set_job, only: [:show, :update, :destroy]

    # GET /jobs
    def index
        @jobs = Job.all
        json_response(@jobs)
    end

    # POST /Jobs
    def create
        @job = Job.create!(job_params)
        json_response(@job, :created)
    end

    # GET /obs/:id
    def show
        json_response(@job)
    end

    # PUT /Jobs/:id
    def update
        @job.update(job_params)
        head :no_content
    end

    # DELETE /Jobs/:id
    def destroy
        @job.destroy
        head :no_content
    end

    private

    def job_params
        # whitelist params
        params.permit(:position, :requirements, :description)
    end

    def set_job
        @job = Job.find(params[:id])
    end
end
