class Country < ActiveRecord::Base
  has_many :cities, dependent: :destroy
  belongs_to :shipping_rate

  delegate :rate, to: :shipping_rate
end
