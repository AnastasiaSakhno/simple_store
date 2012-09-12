require "spec_helper"

describe Customer do
  it { should validate_presence_of (:email) }
  it { should validate_presence_of (:password) }
  it { should validate_presence_of (:name) }

  it "should give active customers who ordered 2 or more items for the last 3 months" do
    check_expected 0
    item = FactoryGirl.create(:item)
    (0..10).each do |index|
      customer = create_customer_with_order_and_check_active index, item, 1
      create_order_with_check_active index + 1, customer, item
      create_order_with_check_active index + 1, customer, item
    end
  end

  private

  def create_customer_with_order_and_check_active expected, item, items_count = 1
    customer = create_customer_with_order item, items_count
    check_expected expected
    customer
  end

  def create_customer_with_order item, items_count = 1
    customer = FactoryGirl.create(:customer)
    items_count.times { create_order customer, item }
    customer
  end

  def create_order_with_check_active expected, customer, item
    order = create_order customer, item
    check_expected expected
    order
  end

  def create_order customer, item
    Order.new(:customer_id => customer.id, :item_id => item.id).save
  end

  def check_expected expected
    Customer.active.size.should == expected
  end
end