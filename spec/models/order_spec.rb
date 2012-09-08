require "spec_helper"

describe "Order" do

  it "should have an item" do
    expect { Order.new FactoryGirl.stub(:customer), nil }.to raise_error (ArgumentError)
  end

  it "should have a customer" do
    expect { Order.new nil, FactoryGirl.stub(:item) }.to raise_error (ArgumentError)
  end

  it "should not raise an exception with a customer and an item" do
    expect { Order.new FactoryGirl.stub(:customer), FactoryGirl.stub(:item) }.not_to raise_error (ArgumentError)
  end
end