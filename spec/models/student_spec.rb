require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'factories' do
    it 'has a valid active factory' do
      active_student = create :student
      expect(active_student).to be_valid
      expect(active_student.active?).to eq true
    end

    it 'has a valid inactive factory trait' do
      active_student = create :student, :inactive
      expect(active_student).to be_valid
      expect(active_student.inactive?).to eq true
    end
  end

  describe 'validations' do
    it 'is invalid without a name' do
      expect(Student.new attributes_for(:student).except(:name)).to be_invalid
    end

    it 'is invalid without a register_number' do
      expect(Student.new attributes_for(:student).except(:register_number)).to be_invalid
    end

    it 'is invalid without a status' do
      expect(Student.new attributes_for(:student).except(:status)).to be_invalid
    end
  end
end
