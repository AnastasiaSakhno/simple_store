require "spec_helper"

describe "Order" do

  it "should have at least one item" do
    expect { Order.new FactoryGirl.stub(:customer), nil }.to raise_error (ArgumentError)
  end

  it "should have a customer" do
    items = [FactoryGirl.stub(:item), FactoryGirl.stub(:item)]
    expect { Order.new nil, items }.to raise_error (ArgumentError)
  end

  it "should not raise an exception with a customer and at least one item" do
    expect { Order.new FactoryGirl.stub(:customer), items }.not_to raise_error (ArgumentError)
  end
end