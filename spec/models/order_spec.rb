require "spec_helper"

describe Order do
  it { should validate_presence_of (:item_id) }
  it { should validate_presence_of (:customer_id) }
  it { should belong_to(:customer) }
  it { should have_db_column(:customer_id) }
  it { should have_db_column(:item_id) }

  it "should give items the customer bought" do
    customer = FactoryGirl.create(:customer)
    item = FactoryGirl.create(:item)
    count = 5
    count.times { Order.new(:customer_id => customer.id, :item_id => item.id).save }
    Order.find_by_customer(customer.id).size.should == count
  end
end