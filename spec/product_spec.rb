require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is created with valid categories" do
      @category = Category.new
      @product = Product.new(
      name: "Plant",
      price_cents: 1000,
      quantity: 10,
      category_id: @category
      )

      @category.products = [@product]
      
      expect(@product).to be_valid
    end

    it "is not created without name" do
      @category = Category.new
      @product = Product.new(
      name: nil,
      price_cents: 1000,
      quantity: 10,
      category_id: @category
      )

      @category.products = [@product]
      
      expect(@product).to_not be_valid
    end

    it "is not created without price" do
      @category = Category.new
      @product = Product.new(
      name: "Plant",
      price_cents: nil,
      quantity: 10,
      category_id: @category
      )

      @category.products = [@product]
      
      expect(@product).to_not be_valid
    end

    it "is not created without quantity" do
      @category = Category.new
      @product = Product.new(
      name: "Plant",
      price_cents: 1000,
      quantity: nil,
      category_id: @category
      )

      @category.products = [@product]
      
      expect(@product).to_not be_valid
    end

    it "is not created without category" do
      @category = Category.new
      @product = Product.new(
      name: "Plant",
      price_cents: 1000,
      quantity: 10,
      category_id: @category
      )
      
      expect(@product).to_not be_valid
    end
    
  end
end