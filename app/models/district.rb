class District < ApplicationRecord
  has_many :customers, dependent: :destroy
  has_many :subscriptions, through: :customers
  validates :name, presence: true, uniqueness: true
end
