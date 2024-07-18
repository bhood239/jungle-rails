require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is valid with valid attributes' do
      product = Product.new(name: 'Sample Product', price: 100, quantity: 10, category: Category.new(name: 'Sample Category'))
      expect(product).to be_valid
    end
    it 'is not valid without valid name' do
      product = Product.new(name: '', price: 100, quantity: 10, category: Category.new(name: 'Sample Category'))
      expect(product).not_to be_valid
    end
     it 'is not valid without valid price' do
      product = Product.new(name: 'Sample Product', quantity: 10, category: Category.new(name: 'Sample Category'))
      expect(product).not_to be_valid
    end
     it 'is not valid without valid quantity' do
      product = Product.new(name: 'Sample Product', price: 100, category: Category.new(name: 'Sample Category'))
      expect(product).not_to be_valid
    end
    it 'is not valid without valid category' do
      product = Product.new(name: 'Sample Product', price: 100, quantity: 10)
      expect(product).not_to be_valid
    end
    it 'is not valid without a name' do
      product = Product.new(price: 100, quantity: 10, category: Category.new(name: 'Sample Category'))
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
  end
end
