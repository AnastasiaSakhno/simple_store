class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id
  belongs_to :customer
  belongs_to :item
  validates :customer_id, :item_id, :presence => {:message => 'can not be blank'}
end
