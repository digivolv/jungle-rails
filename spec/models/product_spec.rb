require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "given a valid input"
    it "is valid" do
      @test_category = Category.create(name: "some new category")
      @test_product = Product.create(name: "Love", price: 1337, quantity:1, category: @test_category)
      expect(@test_product.name).to be_present
      expect(@test_product.price).to be_present
      expect(@test_product.quantity).to be_present
      expect(@test_product.category).to be_present
      expect(@test_product).to be_valid
    end
  end

    context "given name is missing"
    it "should have name as nil and not be valid" do
      @test_category = Category.create(name: "test category")
      @test_product = Product.create(name: nil, category: @test_category, price: 1337, quantity:1)
      expect(@test_product.name).to be_nil
      expect(@test_product).to_not be_valid
    end
    it "should get the error message including 'Name can't be blank'" do
      @test_category = Category.new
      @test_product = Product.create(name: nil, category: @test_category, price: 1337, quantity:1)
      expect(@test_product.name).to be_nil
      expect(@test_product.errors.full_messages).to include("Name can't be blank")
    end

    context "given price is missing"
    it "should have price as nil and not be valid" do
      @test_category = Category.create(name: "test category")
      @test_product = Product.create(name: "Hot dogs", category: @test_category, quantity:1)
      expect(@test_product.price).to be_nil
      expect(@test_product).to_not be_valid
    end
    it "should get the error message including 'Price can't be blank'" do
      @test_category = Category.new
      @test_product = Product.create(name: "Hot dogs", category: @test_category, quantity:1)
      expect(@test_product.errors.full_messages).to include("Price can't be blank")
    end

    context "given quantity is missing"
    it "should have quantity as nil and not be valid" do
      @test_category = Category.create(name: "test category")
      @test_product = Product.create(name: "Sweet summer tea", category: @test_category, price: 1337, quantity: nil)
      expect(@test_product.quantity).to be_nil
      expect(@test_product).to_not be_valid
    end
    it "should get the error message including 'Quantity can't be blank'" do
      @test_category = Category.new
      @test_product = Product.create(name: "Sweet summer tea", category: @test_category, price: 1337, quantity: nil)
      expect(@test_product.errors.full_messages).to include("Quantity can't be blank")
    end


    context "given category is missing"
    it "should have category as nil and not be valid" do
      @test_product = Product.create(name: "Pie", category: nil, price: 1337, quantity:1)
      expect(@test_product.category).to be_nil
      expect(@test_product).to_not be_valid
    end
    it "should get the error message including 'Category can't be blank'" do
      @test_product = Product.create(name: "Pie", price: 1337, quantity:1)
      expect(@test_product.errors.full_messages).to include("Category can't be blank")
    end
  end


