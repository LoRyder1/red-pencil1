require 'spec_helper'

describe 'RedPencilPromo' do
  let(:num) {double('num')}
  subject {RedPencilPromo.new(num, num, num, num)}

  def product_enable method, result
    allow(subject.product).to receive(method.to_sym).and_return(result)
  end

  def enable method, result
    allow(subject).to receive(method.to_sym).and_return(result)    
  end

  it 'expect 4 arguments' do
    expect(subject.method(:initialize).arity).to eq 4
  end

  describe '#percent_reduced' do
    it 'product is an instance of class Product' do
      expect(subject.product).to be_an_instance_of(Product)
    end

    it 'is defined as a method' do
      expect(RedPencilPromo.method_defined?(:percent_reduced)).to be true
    end

    it 'calculate percent_reduced' do
      product_enable('percent_reduced', 9)
      expect(subject.percent_reduced).to eq 9
    end
  end

  describe '#stable_and_on_sale?' do
    it 'is product stable and on sale' do
      product_enable('stable_and_on_sale?', true)
      expect(subject.stable_and_on_sale?).to eq true
    end
  end

  describe '#promo_in_range?' do
    it 'is promo less than 30 and greater than 5' do
      enable('percent_reduced', 20)
      expect(subject.promo_in_range?).to eq true
    end

    it 'out of range promo equals false' do
      enable('percent_reduced', 31)
      expect(subject.promo_in_range?).to eq false
    end
  end

  describe '#increase_price, #decrease_price' do
    let(:num) {50}

    it 'increases promo price' do
      subject.increase_price(10)
      expect(subject.promo_price).to eq 60
    end

    it 'increases in promo price ends promo' do
      subject.increase_price(10)
      expect(subject.promo_valid).to eq false
    end

    it 'decreases promo price' do
      subject.decrease_price(10)
      expect(subject.promo_price).to eq 40
    end
  end

  describe '#sale_under_limit?' do
    it 'sale has max number of days' do
      enable('promo_length',31)
      expect(subject.sale_under_limit?).to eq false
    end
  end

  describe '#end_promo' do
    it 'promo becomes no longer valid'
  end
end

describe 'Product' do
  let(:num) {double('num')}
  subject {Product.new(num, num)}

  def enable method, result
    allow(subject).to receive(method.to_sym).and_return(result)
  end

  it 'expect 2 arguments' do
    expect(subject.method(:initialize).arity).to eq 2
  end

  describe '#percent_reduced' do
    it 'calculates percent reduction' do
      enable('discount', 20); enable('price', 50)
      expect(subject.percent_reduced(num)).to eq 40.0
    end
  end

  describe '#discount' do
    it 'calculates the discount' do
      enable('price', 80)
      expect(subject.discount(75)).to eq 5
    end
  end

  describe '#price_stable?' do
    it 'check stability of price' do
      enable('stability', 20)
      expect(subject.price_stable?).to be false
    end
  end

  describe '#on_sale?' do
    it 'check if product is on sale?' do
      enable('price', 90)
      expect(subject.on_sale?(80)).to be true
    end
  end

  describe '#stable_and_on_sale?' do
    it 'figures if product is table and on sale' do
      enable('price_stable?',true); enable('on_sale?',true)
      expect(subject.stable_and_on_sale?(num)).to eq true
    end
  end
end
