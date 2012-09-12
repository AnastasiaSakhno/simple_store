class Customer < ActiveRecord::Base
  attr_accessible :birthdate, :country, :email, :name, :password, :town
  has_many :orders
  validates :email, :password, :name, :presence => true

  def self.active
    self.joins(:orders => :customer).where("orders.created_at >= '#{Time.zone.now - 3.months}'").group('customer_id').having('count(customer_id) >= 2').all
  end
end
