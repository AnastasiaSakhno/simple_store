require "spec_helper"

describe Item do
  it { should validate_presence_of (:name) }
  it { should validate_presence_of (:price) }
  it { should have_many(:orders) }
  it { should have_db_column(:name) }
  it { should have_db_column(:description) }
  it { should have_db_column(:price).of_type(:decimal).with_options(:precision => 6, :scale => 2) }

  it "should give most popular items (most often ordered)" do
    (1..100).each do |popular|
      customer = FactoryGirl.create(:customer)
      item = FactoryGirl.create(:item)
      popular.times { Order.new(:customer_id => customer.id, :item_id => item.id).save }
      Item.popular.size.should == (Item.popularity_percent / 100.0 * popular.to_f).to_i
    end
  end
end