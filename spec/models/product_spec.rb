require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'has a name, price, quantity, and catagory' do
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: 'Test Product',
        price: 100,
        quantity: 10,
        category: category
      )

      expect(product).to be_valid
    end
    it 'should fail if there is no valid name' do
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: '',
        price: 100,
        quantity: 10,
        category: category
      )
      expect(product).not_to be_valid    
    end
    it 'should fail if there is no valid price' do
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: 'Test Product',
        price_cents: nil,
        quantity: 10,
        category: category
      )
      expect(product).not_to be_valid    
    end
    it 'should fail if there is no valid quantity' do
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: 'Test Product',
        price: 100,
        quantity: nil,
        category: category
      )
      expect(product).not_to be_valid    
    end
    it 'should fail if there is no valid category' do
      category = Category.new(name: 'Test Category')
      product = Product.new(
        name: 'Test Product',
        price: 100,
        quantity: 10,
        category: nil
      )
      expect(product).not_to be_valid    
    end
  end
end
