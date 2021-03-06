require 'pry'

MAX_DAYS = 30
MAX_PERCENT = 30
MIN_PERCENT = 5

class Product
  attr_reader :price, :stability
  def initialize price, stability
    @price, @stability = price, stability
  end

  def stable_and_on_sale? promo_price
    price_stable? && on_sale?(promo_price)
  end

  def price_stable?
    stability >= MAX_DAYS
  end

  def on_sale? promo_price
    price > promo_price
  end

  def percent_reduced promo_price
    discount(promo_price) / price.to_f * 100
  end

  def discount promo_price
    price - promo_price
  end
end

class RedPencilPromo
  attr_reader :promo_price, :product, :promo_valid
  attr_accessor :promo_length
  def initialize promo_price, promo_length, price, stability
    @promo_price, @promo_length = promo_price, promo_length
    @product = Product.new(price, stability)
    @promo_valid = true
  end

  def valid?
    stable_and_on_sale? && promo_in_range? && sale_under_limit? && promo_valid
  end

  def stable_and_on_sale?
    product.stable_and_on_sale?(promo_price)
  end

  def percent_reduced
    product.percent_reduced(promo_price)
  end

  def promo_in_range?
    percent_reduced.between?(MIN_PERCENT,MAX_PERCENT)
  end

  def increase_price amount
    @promo_price += amount
    end_promo
  end

  def decrease_price amount
    @promo_price -= amount
  end

  def sale_under_limit?
    promo_length <= MAX_DAYS
  end

  def end_promo
    @promo_valid = false 
  end
end
