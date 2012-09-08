require "spec_helper"

describe "Customer" do

  it "should give items the customer bought" do
    customer = FactoryGirl.create(:customer)
    item = FactoryGirl.create(:item)
    orders = []
    count = 5
    count.times { orders << Order.new(FactoryGirl(:customer), item) }
    orders.each { |order| order.save }
    Order.find_by_customer_id(customer.id).size.should == count
  end
end