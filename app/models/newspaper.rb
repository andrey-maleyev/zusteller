class Newspaper < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
