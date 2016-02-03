Given(/^I have created a promotion with a price of (\d+)$/) do |price|
  @item = Product.new(price)
end

When(/^I apply a discount of (\d+)% to (\d+)$/) do |discount, price|
  @item.discount_price(price, discount)
end

Then(/^the price should be set to (\d+)$/) do |sale_price|
  expect(@item.current_price).to eq sale_price
end