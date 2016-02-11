class Product
  attr_reader :current_price, :days, :discount, :original_price
  def initialize original_price
    @original_price = original_price
    @current_price = original_price
    @days = 0
    @discount = discount
  end

  def valid_discount? discnt
    @discount = discnt
    if discnt > 5 && discnt < 30
      true
    else
      false
    end
  end

  def discount_price price, discnt
    return price if discnt < 5 || discnt > 30
    @current_price = calc_current_price(price, discnt)
    @discount = discnt
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
  def calc_current_price price, discnt
    price - (price * discnt.to_f / 100)
  end

  def over_30_percent?
    (original_price - current_price).to_f/100 > 30.to_f/100
  end

  def end_promo
    @discount = 0
    @current_price = @original_price
  end
end
