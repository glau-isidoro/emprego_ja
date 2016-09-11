class CompaniesController < ApplicationController
  before_action :set_company, only:[:show, :edit, :update]

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_parameters)
    @company.save
    redirect_to @company
  end

  def edit
  end

  def update
    if @company.update(company_parameters)
      redirect_to @company
    else
      flash[:alert] = 'Não foi possível atualizar a empresa'
      render :edit
    end
  end

  private

  def company_parameters
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

  def set_company
    @company = Company.find(params[:id])
  end

end
