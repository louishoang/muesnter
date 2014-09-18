class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @job_lists = @company.jobs
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
      if @company.save
      flash[:notice] = "New company added successfully."
      redirect_to @company
    else
      render action: 'new'
    end
  end

   def edit
    @company = Company.find(params[:id])
  end

  def update
  @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :location ,:description)
  end
end

