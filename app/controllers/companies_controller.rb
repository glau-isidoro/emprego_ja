class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_parameters)
    @company.save
    redirect_to @company
  end

  private

  def company_parameters
    params.require(:company).permit(:name, :location, :mail, :phone)
  end


end
