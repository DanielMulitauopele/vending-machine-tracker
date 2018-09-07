require 'rails_helper'

describe Snack, type: :model do
  describe 'validations' do
    it { should have_many :machine_snacks }
  end
  describe 'methods' do
    before (:each) do
      @snack1 = Snack.create(name: "food 1", price: 1.50)
      @snack2 = Snack.create(name: "food 2", price: 2.50)
    end
    it 'should be able to average out the price of all snacks' do
      snacks = Snack.all
      avg_price = snacks.average_price
      
      expect(avg_price).to eq(2)
    end
  end
end
