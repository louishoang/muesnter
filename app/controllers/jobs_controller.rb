class JobsController < ApplicationController
  def index
    @jobs = Job.search(params[:search])
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
     if @job.save
      flash[:notice] = "New job added successfully."
      redirect_to @job
    else
      render action: 'new'
    end
  end

   def edit
    @job = Job.find(params[:id])
  end

  def update
  @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to @job
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end
end
