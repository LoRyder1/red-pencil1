class Product
  attr_reader :current_price, :days, :discount, :original_price
  def initialize original_price
    @original_price = original_price
    @current_price = original_price
    @days = 0
    @discount = discount
  end

  def valid_discount? discount
    @discount = discount
    if discount > 5 && discount < 30
      true
    else
      false
    end
  end

  def discount_price price, discount
    return price if discount < 5 || discount > 30
    amount_reduced = (price * discount.to_f / 100)
    @current_price = price - amount_reduced
    end_promo if over_30_percent?
    current_price
  end

  def add_duration days
    @days += days
    if days > 30
      @discount = 0
      @current_price = @original_price
    end
  end

  def increase_price price, increase
    @current_price = price + increase
    @discount = 0
    current_price
  end

  private
  def over_30_percent? 
    (original_price - current_price).to_f/100 > 30.to_f/100
  end

  def end_promo
    @discount = 0
    @current_price = @original_price
  end
end

x = Product.new(100)
p x.discount_price(100,10)
p x.discount_price(90,30)
p x.current_price
# p x.valid_discount? 20
p x.discount
# p x.original_price
