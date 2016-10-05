require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(create :course).to be_valid
    end
  end

  describe 'validations' do
    it 'is invalid without a name' do
      expect(Course.new attributes_for(:course).except(:name)).to be_invalid
    end
  end
end
