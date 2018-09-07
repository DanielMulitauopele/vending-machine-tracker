require 'rails_helper'

describe 'as a visitor' do
  describe 'visitor can see individual snack show page' do
    before (:each) do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @snack1 = @dons.snacks.create(name: "food 1", price: 1.50)
      @snack2 = @dons.snacks.create(name: "food 2", price: 2.50)
    end
    it 'should show snack details' do
      visit machine_path(@dons)

      expect(page).to have_content(@snack1.name)
      expect(page).to have_content(@snack2.name)

      click_on 'food 1'

      expect(current_path).to eq(machine_snack_path(@dons.id))
      expect(page).to have_content(@snack1.name)
      expect(page).to have_content(@snack1.price)
    end
  end
end
