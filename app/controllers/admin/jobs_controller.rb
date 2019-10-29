class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]
  before_action :check_permission
  layout "admin"

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to admin_jobs_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  def appear
    @job = Job.find(params[:id])
    @job.exist = "Y"
    @job.save
    redirect_to admin_jobs_path
  end

  def disappear
    @job = Job.find(params[:id])
    @job.exist = "N"
    @job.save
    redirect_to admin_jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email)
  end

  def check_permission
    if !current_user.admin == "Y"
      redirect_to jobs_path
    end
  end

end

