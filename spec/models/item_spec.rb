require "spec_helper"

describe "Item" do

  it "should raise an exception if name or price are blank" do
    expect { FactoryGirl.create(:item, :name => nil) }.to raise_error (ArgumentError)
  end

  it "should not raise an exception with name and price" do
    expect { FactoryGirl.stub(:item) }.not_to raise_error (ArgumentError)
  end
end