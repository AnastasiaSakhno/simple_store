require "spec_helper"

describe "Item" do

  it "should raise an exception if name is blank" do
    expect { FactoryGirl.stub(:blank_item) }.to raise_error (ArgumentError)
  end

  it "should not raise an exception with name and price" do
    expect { FactoryGirl.stub(:item) }.not_to raise_error (ArgumentError)
  end
end