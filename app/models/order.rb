class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id
  belongs_to :customer
  has_and_belongs_to_many :items, :join_table => :orders_items
  validates :customer_id, :item_id, :presence => true

  def self.find_by_customer id
    self.where(customer_id: id)
  end
end
