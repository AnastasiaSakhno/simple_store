class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id
  belongs_to :customer
  belongs_to :item

  def initialize customer, items
    raise ArgumentError.new 'customer can not be nil' if customer == nil
    raise ArgumentError.new 'items can not be nil or blank' if items == nil || items.blank?
    @customer = customer
    @items = items
  end
end
