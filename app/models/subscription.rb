class Subscription < ApplicationRecord
  belongs_to :newspaper
  belongs_to :customer
end
