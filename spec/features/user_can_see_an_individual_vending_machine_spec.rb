require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  before (:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @snack1 = @dons.snacks.create(name: "food 1", price: 1.50)
    @snack2 = @dons.snacks.create(name: "food 2", price: 2.50)
  end
  scenario 'they see the location of that machine' do

    visit machine_path(@dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'can list out all the snacks that belong to that vending machine' do
    visit machine_path(@dons)

    expect(page).to have_content(@snack1.name)
    expect(page).to have_content(@snack2.name)
    expect(page).to have_content(@snack1.price)
    expect(page).to have_content(@snack2.price)
  end
end
