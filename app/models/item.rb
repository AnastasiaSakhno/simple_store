class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price
  has_many :orders

  def initialize name, price, description
    raise ArgumentError.new 'name can not be blank' if name == nil || name.blank?
    raise ArgumentError.new 'price can not be blank' if price == nil || price.blank?
    @name = name
    @price = price
    @description = description
  end
end
