class SubscriptionsController < ApplicationController
  before_action :set_district, only: [:index, :new]
  before_action :set_subscription, only: [:destroy, :change_status]

  def index
    @subscriptions = Subscription.where(customer_id: Customer.where(district_id: @district)).order(:order_index)
  end

  def new
    @subscription = Subscription.new
    # we need @customers collection in our `simple_form_for` to show customers in dropdown box 
    @customers = Customer.where(district_id: @district).order(:address)
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.is_active = true
    @subscription.save
    redirect_to district_subscriptions_path
  end

  def destroy
    @subscription.destroy
    redirect_to district_subscriptions_path(@subscription.customer.district)
  end

  def change_status
    @subscription.is_active == true ? @subscription.is_active = false : @subscription.is_active = true
    @subscription.save
    redirect_to district_subscriptions_path(@subscription.customer.district)
  end
  
  private

  def set_district
    @district = District.find(params[:district_id])
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:customer_id, :newspaper_id, :is_monday,
      :is_tuesday, :is_wednesday, :is_thursday, :is_friday, :is_saturday)
  end
end
