class SubscriptionsController < ApplicationController
  before_action :set_district, only: [:index, :new]

  def index
    @subscriptions = Subscription.where(customer_id: Customer.where(district_id: @district))
  end

  def new
    @subscription = Subscription.new
    # we need @customers collection in our `simple_form_for` to show customers in dropdown box 
    @customers = Customer.where(district_id: @district).order(:address)
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.save
    redirect_to district_subscriptions_path
  end
  
  private

  def set_district
    @district = District.find(params[:district_id])
  end

  def subscription_params
    params.require(:subscription).permit(:customer_id, :newspaper_id, :is_monday, :is_tuesday,
      :is_wednesday, :is_thursday, :is_friday, :is_saturday)
  end
end
