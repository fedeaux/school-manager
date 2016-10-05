# no-override

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factories' do
    it 'has valid factories' do
      expect(create :user_ray).to be_valid
      expect(create :user_steve).to be_valid
    end
  end
end
