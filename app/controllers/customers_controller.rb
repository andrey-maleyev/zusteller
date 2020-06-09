class CustomersController < ApplicationController
  before_action :set_district, only: [:index, :new]

  def index
    @customers = Customer.where(district_id: @district).order(:address)
  end

  def new
    # we need @district in our `simple_form_for` (views\customers\_form.html.erb), so we use before_action
    @customer = Customer.new
  end

  private

  def set_district
    @district = District.find(params[:district_id])
  end
end
