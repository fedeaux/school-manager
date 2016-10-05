require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    let(:classroom_attributes) {
      {
        student: create(:student),
        course: create(:course)
      }
    }

    it 'is invalid without a student' do
      expect(Classroom.new classroom_attributes.except(:student)).to be_invalid
    end

    it 'is invalid without a course' do
      expect(Classroom.new classroom_attributes.except(:course)).to be_invalid
    end

    it 'is invalid if there are a classroom with the given student and course' do
      Classroom.create classroom_attributes
      expect(Classroom.new classroom_attributes).to be_invalid
    end
  end
end
