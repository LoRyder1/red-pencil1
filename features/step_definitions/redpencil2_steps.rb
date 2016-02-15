Given(/^I have created a promotion with a price of (\d+)$/) do |price|
  @chair = RedPencilPromo.new(80,15,100,31)
end

When(/^I apply a discount of (\d+)% to (\d+)$/) do |discount, price|
  @chair.decrease_price(amount)
end

Then(/^the price should be set to (\d+)$/) do |sale_price|
  expect(@chair.promo_price).to eq sale_price
end

When(/^the promotion runs for (\d+) days$/) do |days|
  @item.add_duration(days)
end
