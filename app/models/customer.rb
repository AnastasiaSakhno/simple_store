class Customer < ActiveRecord::Base
  attr_accessible :birthdate, :country, :email, :name, :password, :town
  has_many :orders
  validates :email, :password, :name, :presence => {:message => 'can not be blank'}
end
