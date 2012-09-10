require "spec_helper"

describe "Customer" do

  it "should give items the customer bought" do
    customer = FactoryGirl.create(:customer)
    item = FactoryGirl.create(:item)
    orders = []
    count = 5
    count.times { orders << Order.new(:customer_id => customer.id, :item_id => item.id) }
    orders.each { |order| order.save }
    Order.find_by_customer(customer.id).size.should == count
  end
end