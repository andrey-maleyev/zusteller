class CustomersController < ApplicationController
  before_action :set_district, only: [:index]

  def index
    @customers = Customer.where(district_id: @district).order(:address)
  end
   
  private
 
  def set_district
    @district = District.find(params[:district_id])
  end
end
