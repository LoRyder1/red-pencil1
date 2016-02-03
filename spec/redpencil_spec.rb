require 'spec_helper'

describe 'Product' do
  let(:price) { double('price') }
  subject { Product.new(price) }

  describe '#valid_discount?' do
    it 'discount of 10% is valid' do
      expect(subject.valid_discount?(10)).to eq true
    end

    it 'discount of 4% is invalid' do
      expect(subject.valid_discount?(4)).to eq false
    end

    it 'discount of 31% is invalid' do
      expect(subject.valid_discount?(31)).to eq false
    end
  end

  describe '#discount_price' do 
    it 'a 10% discount should reduce the price appropriately' do
      expect(subject.discount_price(100,10)).to eq 90
    end

    it 'a 20% discount should reduce the price appropriately' do
      expect(subject.discount_price(100,20)).to eq 80
    end
  end
end