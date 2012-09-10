class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price
  validates :name, :price, :presence => true
end
