class CustomersController < ApplicationController
  before_action :set_district, only: [:index, :new, :create]

  def index
    @customers = Customer.where(district_id: @district).order(:address)
  end

  def new
    # we need @district in our `simple_form_for` (views\customers\_form.html.erb), so we use before_action
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    # we need `district_id` to associate customer with corresponding district, so we use before_action
    @customer.district = @district
    @customer.save
    redirect_to district_customers_path
  end

  private

  def set_district
    @district = District.find(params[:district_id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :delivery_note)
  end
end
