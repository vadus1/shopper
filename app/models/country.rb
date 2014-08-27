class Country < ActiveRecord::Base
  has_many :cities
  belongs_to :shipping_rate

  delegate :rate, to: :shipping_rate
end
