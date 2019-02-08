class City < ApplicationRecord
  has_many :users
  
  validates :town,
    presence: true
  validates :country,
    presence: true
end
