class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price
  has_many :orders
  validates :name, :price, :presence => true
  @@popularity_percent = 10.0
  cattr_reader :popularity_percent

  def self.popular
    items =  self.select('items.*, count(items.id) as order_count').joins(:orders).group('items.id').order('order_count desc').all
    count = (@@popularity_percent / 100.0 * items.size.to_f).to_i
    items[0, count]
  end
end
