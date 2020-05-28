class Customer < ApplicationRecord
  belongs_to :district
  has_many :subscriptions, dependent: :destroy
end
