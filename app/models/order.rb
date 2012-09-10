class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id
  belongs_to :customer
  belongs_to :item
  validates :customer_id, :item_id, :presence => true

  def self.find_by_customer id
    Order.where(customer_id: id)
  end
end
