class PharmaciesController < ApplicationController
  before_filter :get_company
  # GET /pharmacies
  # GET /pharmacies.json
  def index
    @pharmacies = @company.pharmacies.all
  end

  # GET /pharmacies/1
  # GET /pharmacies/1.json
  def show
    @pharmacy = @company.pharmacies.find(params[:id])
  end

  # GET /pharmacies/new
  # GET /pharmacies/new.json
  def new
    @pharmacy = @company.pharmacies.build
  end

  # GET /pharmacies/1/edit
  def edit
    @pharmacy = @company.pharmacies.find(params[:id])
  end

  # POST /pharmacies
  # POST /pharmacies.json
  def create
    @pharmacy = @company.pharmacies.build(params[:pharmacy])
    if @pharmacy.save
      redirect_to(company_pharmacies_url(@company), :notice => 'Pharmacy was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /pharmacies/1
  # PUT /pharmacies/1.json
  def update
    @pharmacy = @company.pharmacies.find(params[:id])
    if @pharmacy.update_attributes(params[:pharmacy])
      redirect_to(company_pharmacies_url(@company), :notice => 'Pharmacy was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /pharmacies/1
  # DELETE /pharmacies/1.json
  def destroy
    @pharmacy = @company.pharmacies.find(params[:id])
    @pharmacy.destroy
    redirect_to(company_pharmacies_url(@company))
  end
  
 protected
  
  def get_company
    @company = Company.find_by_id(params[:company_id])
    redirect_to root_path unless @company
  end
end
