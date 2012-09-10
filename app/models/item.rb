class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price
  has_many :orders
  validates :name, :price, :presence => true
end
