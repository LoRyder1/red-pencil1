Given(/^I have created a promotion with a price of (\d+)$/) do |price|
  @chair = RedPencilPromo.new(price,0,price,31)
end

When(/^I apply a discount of (\d+)$/) do |amount|
  @chair.decrease_price(amount)
end

Then(/^the price should be set to (\d+)$/) do |sale_price|
  expect(@chair.promo_price).to eq sale_price
end

And(/^the promo should be (\S[a-z]*)$/) do |boolean|
  expect(@chair.valid?).to eq boolean
end

When(/^the promotion runs for (\d+) days$/) do |days|
  @chair.promo_length = days
end
