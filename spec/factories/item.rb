FactoryGirl.define do
  factory :blank_item do
    name nil
    price nil
  end

  factory :item, :parent => :blank_item do
    name 'some interesting book'
    price 193.00
    description 'it is a very interesting book'
  end

  factory :item_with_blank_name, :parent => :blank_item do
    price 193.00
  end

  factory :item_with_blank_price, :parent => :blank_item do
    name 'some interesting book'
  end
end