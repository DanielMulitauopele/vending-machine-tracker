require 'rails_helper'

describe MachineSnack, type: :model do
  describe 'validations' do
    it { should belong_to :snack }
    it { should belong_to :machine }
  end
end
