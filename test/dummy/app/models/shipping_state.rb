class ShippingState < ActiveRecord::Base
  attr_accessible :name
  has_many :invoices
end
