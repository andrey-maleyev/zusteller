class SubscriptionsController < ApplicationController
  before_action :set_district, only: [:index, :new, :create]
  before_action :set_subscription, only: [:destroy, :change_status, :order_up, :order_down]
  before_action :set_subscriptions, only: [:index, :create, :destroy]

  def index
    # rewriting order-index from 2
    # we use even numbers as index for to make simpler changing subscription order
    i = 2
    @subscriptions.each do |item|
      item.order_index = i
      item.save
      i += 2
    end
  end

  def new
    @subscription = Subscription.new
    # we need @customers collection in our `simple_form_for` to show customers in dropdown box 
    @customers = Customer.where(district_id: @district).order(:address)
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.is_active = true

    # finding max value of order-index
    # order-index serves to order subscriptions in necessary way
    array_orders = []
    @subscriptions.each do |item|
      array_orders << item.order_index
    end
    @subscription.order_index = array_orders.max + 2

    @subscription.save
    redirect_to district_subscriptions_path
  end

  def destroy
    @subscription.destroy
    redirect_to district_subscriptions_path(@subscription.customer.district)
  end

  # changing subscription status: enabled or disabled
  def change_status
    @subscription.is_active == true ? @subscription.is_active = false : @subscription.is_active = true
    @subscription.save
    redirect_to district_subscriptions_path(@subscription.customer.district)
  end

  # changing subscription order
  def order_up
    @subscription.order_index = @subscription.order_index - 3
    @subscription.save
    redirect_to district_subscriptions_path(@subscription.customer.district)
  end

  # changing subscription order
  def order_down
    @subscription.order_index = @subscription.order_index + 3
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

  def set_subscriptions
    @subscriptions = Subscription.where(customer_id: Customer.where(district_id: @district)).order(:order_index)
  end

  def subscription_params
    params.require(:subscription).permit(:customer_id, :newspaper_id, :is_monday,
      :is_tuesday, :is_wednesday, :is_thursday, :is_friday, :is_saturday)
  end
end