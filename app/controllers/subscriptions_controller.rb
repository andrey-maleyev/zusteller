class SubscriptionsController < ApplicationController
  before_action :set_district, only: [:index]

  def index
    @subscriptions = Subscription.where(customer_id: Customer.where(district_id: @district))
  end
  
  private

  def set_district
    @district = District.find(params[:district_id])
  end
end
