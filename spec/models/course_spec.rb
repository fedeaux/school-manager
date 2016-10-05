require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'factories' do
    it 'has a valid active factory' do
      active_course = create :course
      expect(active_course).to be_valid
      expect(active_course.active?).to eq true
    end

    it 'has a valid inactive factory trait' do
      active_course = create :course, :inactive
      expect(active_course).to be_valid
      expect(active_course.inactive?).to eq true
    end
  end

  describe 'validations' do
    it 'is invalid without a name' do
      expect(Course.new attributes_for(:course).except(:name)).to be_invalid
    end

    it 'is invalid without a status' do
      expect(Course.new attributes_for(:course).except(:status)).to be_invalid
    end
  end
end
