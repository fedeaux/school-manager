require 'rails_helper'

RSpec.describe "Course students (classrooms) requests", type: :request do
  let(:course) { create :course }
  let(:student_1) { create :student }
  let(:student_2) { create :student }
  let(:student_3) { create :student }

  describe "GET /api/courses/:course_id/students" do
    it 'returns a list of students for a given course' do
      # Add students 1 and 2 to course
      Classroom.create student: student_1, course: course
      Classroom.create student: student_2, course: course

      # ensure student 3 is created
      student_3

      get api_course_students_path(course_id: course.id)
      json_response = JSON.parse(response.body)

      expect(json_response['students'].count).to eq 2

      course_students = json_response['students'].map { |student_attributes|
        Student.find student_attributes['id']
      }

      expect(course_students).to include student_1, student_2
      expect(course_students).not_to include student_3
    end
  end

  # describe "POST /api/courses" do
  #   it 'creates a new course' do
  #     post api_courses_path, params: { course: attributes_for(:course) }
  #     json_response = JSON.parse(response.body)
  #     expect(json_response).to have_key 'course'
  #   end
  # end

  # describe "PUT /api/courses" do
  #   it 'updates a course' do
  #     course = create :course

  #     put api_course_path(course), params: { course: { name: 'Engineering' } }
  #     json_response = JSON.parse(response.body)
  #     expect(json_response).to have_key 'course'
  #     expect(json_response['course']['name']).to eq 'Engineering'
  #   end
  # end
end
